require 'bundler/setup'
require 'simplecov'
require 'vulkan'
require 'sdl2_vulkan'
require 'cglm'
require 'chunky_png'

include CGLM
UniformBufferStruct = Vulkan.struct(['float model[16]', 'float view[16]', 'float proj[16]'])
def UniformBufferStruct.alignment; Mat4.alignment; end
$ubo = UniformBufferStruct.new(CGLM.alloc(UniformBufferStruct))
# $model_matrix       = Mat4.new(addr: $ubo.to_ptr + $ubo.offset_of('model'))
# $view_matrix        = Mat4.new(addr: $ubo.to_ptr + $ubo.offset_of('view'))
# $projection_matrix  = Mat4.new(addr: $ubo.to_ptr + $ubo.offset_of('proj'))
$model_matrix       = Mat4.new(addr: $ubo.to_ptr)
$view_matrix        = Mat4.new(addr: $ubo.to_ptr + Fiddle::SIZEOF_FLOAT * 16)
$projection_matrix  = Mat4.new(addr: $ubo.to_ptr + Fiddle::SIZEOF_FLOAT * 32)

Vertex = Vulkan.struct(['float pos[2]', 'float color[3]', 'float texcoords[2]'])
VertexData = Vulkan.struct('vertices[4]' => Vertex).malloc
VertexData.vertices[0].pos = [-0.5, -0.5]; VertexData.vertices[0].color = [1, 0, 0]; VertexData.vertices[0].texcoords = [1, 0]
VertexData.vertices[1].pos = [ 0.5, -0.5]; VertexData.vertices[1].color = [0, 1, 0]; VertexData.vertices[1].texcoords = [0, 0]
VertexData.vertices[2].pos = [ 0.5,  0.5]; VertexData.vertices[2].color = [0, 0, 1]; VertexData.vertices[2].texcoords = [0, 1]
VertexData.vertices[3].pos = [-0.5,  0.5]; VertexData.vertices[3].color = [1, 1, 1]; VertexData.vertices[3].texcoords = [1, 1]

IndexData = Vulkan.struct(['uint16_t indices[6]']).malloc
IndexData.indices = [0, 1, 2, 2, 3, 0]

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

command_pool = device.create_command_pool queue_family: graphics_queue_family

# Populate the vertex buffer
staging_buffer = device.create_buffer size: VertexData.size, usage: Vulkan::VK_BUFFER_USAGE_TRANSFER_SRC_BIT
staging_buffer.map { |data| data[0, VertexData.size] = VertexData[0, VertexData.size] }
VertexBuffer = device.create_buffer size: VertexData.size,
                                    usage: Vulkan::VK_BUFFER_USAGE_TRANSFER_DST_BIT | Vulkan::VK_BUFFER_USAGE_VERTEX_BUFFER_BIT,
                                    properties: :device_local
vertex_transfer_buffer = command_pool.create_command_buffer(usage: :one_time_submit) { |cmd| cmd.copy_buffer staging_buffer, VertexBuffer }

# Populate the index buffer
staging_buffer = device.create_buffer size: IndexData.size, usage: Vulkan::VK_BUFFER_USAGE_TRANSFER_SRC_BIT
staging_buffer.map { |data| data[0, IndexData.size] = IndexData[0, IndexData.size] }
IndexBuffer = device.create_buffer size: IndexData.size,
                                   usage: Vulkan::VK_BUFFER_USAGE_TRANSFER_DST_BIT | Vulkan::VK_BUFFER_USAGE_INDEX_BUFFER_BIT,
                                   properties: :device_local
index_transfer_buffer = command_pool.create_command_buffer(usage: :one_time_submit) { |cmd| cmd.copy_buffer staging_buffer, IndexBuffer }

# Submit both transfers and wait for them to complete
graphics_queue.submit([vertex_transfer_buffer, index_transfer_buffer])
# graphics_queue.wait_until_idle

UniformBuffers = []

png = ChunkyPNG::Image.from_file(File.expand_path('textures/texture.png', __dir__))
image_data = png.to_rgba_stream
image_data_buffer = device.create_buffer size: image_data.size,
                                         usage: Vulkan::VK_BUFFER_USAGE_TRANSFER_SRC_BIT,
                                         properties: [:host_visible, :host_coherent]
image_data_buffer.map { |data| data[0, image_data.size] = image_data }
texture = device.create_image dimensions: 2,
                              width: png.width,
                              height: png.height,
                              depth: 1,
                              mip_levels: 1,
                              array_layers: 1,
                              format: :r8g8b8a8_unorm,
                              tiling: :optimal,
                              initial_layout: :undefined,
                              usage: [:transfer_dst, :sampled],
                              sharing: :exclusive,
                              samples: 1
texture.transition_layout command_pool, graphics_queue, to: :transfer_dst_optimal
texture.copy_from_buffer  command_pool, graphics_queue, buffer: image_data_buffer, width: png.width, height: png.height
graphics_queue.wait_until_idle
texture_view = texture.create_view
sampler = device.create_sampler

shader_stages = [
  device.create_shader_stage(file_path: File.expand_path('./shaders/textures.vert.spv', __dir__),
                             stage: Vulkan::VK_SHADER_STAGE_VERTEX_BIT),
  device.create_shader_stage(file_path: File.expand_path('./shaders/textures.frag.spv', __dir__),
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
                                     format: :r32g32_sfloat,
                                     offset: Vertex.offset_of('pos')

  pipeline.add_attribute_description binding: 0,
                                     location: 1,
                                     format: :r32g32b32_sfloat,
                                     offset: Vertex.offset_of('color')

  pipeline.add_attribute_description binding: 0,
                                     location: 2,
                                     format: :r32g32_sfloat,
                                     offset: Vertex.offset_of('texcoords')

  # Create a uniform buffer for each image in the swapchain, so that we don't
  # modify a buffer for a frame still in-flight
  UniformBuffers.clear
  $swapchain.size.times do |i|
    UniformBuffers[i] = device.create_buffer size: UniformBufferStruct.size,
                                             usage: Vulkan::VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT,
                                             properties: [:host_visible, :host_coherent]
  end
  descriptor_set_pool = device.create_descriptor_set_pool pool_sizes: [
                                                            {type: :uniform_buffer,         count: $swapchain.size},
                                                            {type: :combined_image_sampler, count: $swapchain.size}
                                                          ],
                                                          max_sets: $swapchain.size
  descriptor_set_layout = pipeline.add_descriptor_set_layout descriptors: [{
                                                               binding: 0,
                                                               type: :uniform_buffer,
                                                               stages: [:vertex]
                                                             }, {
                                                               binding: 1,
                                                               type: :combined_image_sampler,
                                                               stages: [:fragment]
                                                             }]
  descriptor_sets = descriptor_set_pool.alloc(layouts: [descriptor_set_layout] * $swapchain.size)
  descriptor_sets.each_with_index do |set, i|
    set[0].set_buffer                 UniformBuffers[i]
    set[1].set_image_view_and_sampler texture_view, sampler
    set.commit
  end

  shader_stages.each { |stage| pipeline.add_shader_stage(stage) }
  pipeline.commit(render_pass)

  $command_buffers = command_pool.create_command_buffers(framebuffers.size) do |cmd, index|
    cmd.render_pass(render_pass, framebuffer: framebuffers[index]) do
      cmd.bind_pipeline(:graphics, pipeline)
      cmd.bind_vertex_buffer(VertexBuffer)
      cmd.bind_index_buffer(IndexBuffer, type: :uint16)
      cmd.bind_descriptor_set(:graphics, descriptor_sets[index], pipeline_layout: pipeline.layout)
      cmd.draw_indexed(IndexData.indices.size, 1, 0, 0, 0)
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
start_time = Time.now
done = false

# Begin main event loop & drawing
until done
  frame_counter += 1
  break if ENV['MAX_FRAMES'].to_i == frame_counter
  # dump some FPS infos
  uptime = Time.now - start_time
  if frame_counter % 300 == 0
    fps = frame_counter / uptime
    p ['fps: ', fps, 'frame-time (ms): ', 1000.0 / fps]
  end
  while event = SDL2::Event.poll
    case event
    when SDL2::Event::Quit, SDL2::Event::KeyDown then done = true
    when SDL2::Event::Window::RESIZED then rebuild_swap_chain.call
    end
  end

  begin
    in_flight_fences[current_frame].wait_and_reset
    image_index = $swapchain.next_image_index(semaphore: image_available_semaphores[current_frame])
    UniformBuffers[image_index].map do |data|
      Mat4.identity $model_matrix
      $model_matrix.rotate! Vec3.new([0, 0, 1]), uptime * 90.to_radians
      Mat4.look_at Vec3.new([2, 2, 2]), Vec3.zero, Vec3.new([0, 0, 1]), $view_matrix
      Mat4.perspective $projection_matrix, fovy: 45.to_radians,
                                           aspect: $swapchain.width.to_f / $swapchain.height.to_f,
                                           near: 0.1,
                                           far: 10
      $projection_matrix[1][1] *= -1
      data[0, $ubo.size] = $ubo[0, $ubo.size]
    end
    graphics_queue.submit([$command_buffers[image_index]],
                          wait_semaphores:   [image_available_semaphores[current_frame]],
                          wait_stages:       [Vulkan::VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT],
                          signal_semaphores: [render_finished_semaphores[current_frame]],
                          fence:             in_flight_fences[current_frame])
    presentation_queue.present(swapchains:      [$swapchain],
                               image_indices:   [image_index],
                               wait_semaphores: [render_finished_semaphores[current_frame]])
    current_frame = (current_frame + 1) % MAX_FRAMES_IN_FLIGHT
  rescue Vulkan::Error
    case $!.code
    when Vulkan::VK_ERROR_OUT_OF_DATE_KHR, Vulkan::VK_SUBOPTIMAL_KHR
      rebuild_swap_chain.call
    else raise
    end
  end
end

in_flight_fences.each { |fence| fence.wait_and_reset }
