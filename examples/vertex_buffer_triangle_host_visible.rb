require 'bundler/setup'
require 'vulkan'
require 'sdl2_vulkan'

Vertex = Vulkan.struct(['float pos[2]', 'float color[3]'])
VertexData = Vulkan.struct('vertices[3]' => Vertex).malloc
VertexData.vertices[0].pos = [ 0,  -0.5]; VertexData.vertices[0].color = [1, 0, 0]
VertexData.vertices[1].pos = [ 0.5, 0.5]; VertexData.vertices[1].color = [0, 1, 0]
VertexData.vertices[2].pos = [-0.5, 0.5]; VertexData.vertices[2].color = [0, 0, 1]

# Create a window that we plan to draw to
SDL2.init(SDL2::INIT_EVERYTHING)
window = SDL2::Window.create "test-vulkan", 0, 0, 640, 480, SDL2::Window::Flags::VULKAN |
                                                            SDL2::Window::Flags::RESIZABLE

# Create a Vulkan instance
instance = Vulkan::Instance.new extensions: window.vk_instance_extensions

# Create a rendering surface
surface = instance.create_window_surface(window)

# Choose an adequate physical device
dev = instance.physical_devices.detect do |dev|
  next false unless swapchain_surface_info = dev.swapchain_surface_info(surface)
  builder = Vulkan::SwapchainBuilder.new(swapchain_surface_info)
  dev.properties[:device_type] == :discrete_gpu &&
    builder.optimal_format && builder.optimal_presentation_mode
end
raise 'could not find a suitable physical device' unless dev

# Find a queue family that supports graphics
graphics_queue_family = dev.queue_families.detect do |family|
  family[:queue_count] > 0 && family.supports?(:graphics)
end
raise 'no graphics queue family available' unless graphics_queue_family

# Find a queue family that supports presentation to the rendering surface
presentation_queue_family = dev.queue_families.detect do |family|
  family[:queue_count] > 0 && family.supports_presentation?(surface)
end
raise 'no graphics queue family available' unless presentation_queue_family

# Create a logical device along with the needed extensions and chosen queues
if graphics_queue_family == presentation_queue_family
  device = dev.create queues: [{ family: graphics_queue_family,     priorities: [1.0] }],
                      extensions: ['VK_KHR_swapchain']
  presentation_queue = graphics_queue = device.queue_families[0][:queues][0]
else
  device = dev.create queues: [{ family: graphics_queue_family,     priorities: [1.0] },
                               { family: presentation_queue_family, priorities: [1.0] }],
                      extensions: ['VK_KHR_swapchain']
  graphics_queue     = device.queue_families[0][:queues][0]
  presentation_queue = device.queue_families[1][:queues][0]
end

VertexBuffer = device.create_vertex_buffer size: VertexData.size, usage: Vulkan::VK_BUFFER_USAGE_VERTEX_BUFFER_BIT
VertexBuffer.map do |data|
  data[0, VertexData.size] = VertexData[0, VertexData.size]
end

command_pool = device.create_command_pool queue_family: graphics_queue_family

shader_stages = [
  device.create_shader_stage(file_path: File.expand_path('./shaders/vertex_buffer.vert.spv', __dir__),
                             stage: Vulkan::VK_SHADER_STAGE_VERTEX_BIT),
  device.create_shader_stage(file_path: File.expand_path('./shaders/triangle.frag.spv', __dir__),
                             stage: Vulkan::VK_SHADER_STAGE_FRAGMENT_BIT)
]

rebuild_swap_chain = proc do
  # Create a swapchain for image presentation
  $swapchain = device.create_swapchain surface: surface,
                                       surface_width: window.vk_drawable_size[0],
                                       surface_height: window.vk_drawable_size[1]

  # Create render pass with one subpass
  render_pass = device.create_renderpass
  subpass = render_pass.add_subpass
  subpass.add_color_attachment_ref index: render_pass.add_attachment(format: $swapchain.format),
                                   layout: :color
  render_pass.commit

  # Create a framebuffer for each image in the swap chain
  framebuffers = $swapchain.framebuffers(render_pass: render_pass)

  # Create graphic pipeline
  pipeline = device.create_pipeline($swapchain)
  pipeline.add_binding_description binding: 0,
                                   stride: Vertex.size,
                                   input_rate: Vulkan::VK_VERTEX_INPUT_RATE_VERTEX

  pipeline.add_attribute_description binding: 0,
                                     location: 0,
                                     format: Vulkan::VK_FORMAT_R32G32_SFLOAT,
                                     offset: Vertex.offset_of('pos')

  pipeline.add_attribute_description binding: 0,
                                     location: 1,
                                     format: Vulkan::VK_FORMAT_R32G32B32_SFLOAT,
                                     offset: Vertex.offset_of('color')
  shader_stages.each { |stage| pipeline.add_shader_stage(stage) }
  pipeline.commit(render_pass)

  $command_buffers = command_pool.create_command_buffers(framebuffers.size) do |cmd, index|
    cmd.render_pass(render_pass, framebuffer: framebuffers[index]) do
      cmd.bind_pipeline(:graphics, pipeline)
      cmd.bind_vertex_buffer(VertexBuffer)
      cmd.draw(VertexData.vertices.size, 1, 0, 0)
    end
  end
end

rebuild_swap_chain.call

MAX_FRAMES_IN_FLIGHT = 2
image_available_semaphores = MAX_FRAMES_IN_FLIGHT.times.map { device.create_semaphore }
render_finished_semaphores = MAX_FRAMES_IN_FLIGHT.times.map { device.create_semaphore }
in_flight_fences           = MAX_FRAMES_IN_FLIGHT.times.map { device.create_fence signaled: true }
current_frame = 0
frame_counter = 0

# Begin main event loop & drawing
loop do
  frame_counter += 1
  break if ENV['MAX_FRAMES'].to_i == frame_counter
  while event = SDL2::Event.poll
    case event
    when SDL2::Event::Quit, SDL2::Event::KeyDown then ENV['MAX_FRAMES'] = (frame_counter + 1).to_s
    when SDL2::Event::Window::RESIZED then rebuild_swap_chain.call
    end
  end

  begin
    in_flight_fences[current_frame].wait_and_reset
    image_index = $swapchain.next_image_index(semaphore: image_available_semaphores[current_frame])
    graphics_queue.submit([$command_buffers[image_index]],
                          wait_semaphores:   [image_available_semaphores[current_frame]],
                          wait_stages:       [Vulkan::VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT],
                          signal_semaphores: [render_finished_semaphores[current_frame]],
                          fence:             in_flight_fences[current_frame])
    presentation_queue.present(swapchains:      [$swapchain],
                               image_indices:   [image_index],
                               wait_semaphores: [render_finished_semaphores[current_frame]])
    currentFrame = (current_frame + 1) % MAX_FRAMES_IN_FLIGHT
  rescue Vulkan::Error
    case $!.code
    when Vulkan::VK_ERROR_OUT_OF_DATE_KHR, Vulkan::VK_SUBOPTIMAL_KHR
      rebuild_swap_chain.call
    else raise
    end
  end
end

in_flight_fences.each { |fence| fence.wait_and_reset }
