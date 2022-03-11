# https://vulkan-tutorial.com/code/29_multisampling.cpp

require 'bundler/setup'
require 'simplecov'
require 'vulkan'
require 'sdl2_vulkan'
require 'cglm'
require 'chunky_png'
require 'oily_png'
require 'tiny_obj'

include CGLM
UniformBufferStruct = Vulkan.struct(['float model[16]', 'float view[16]', 'float proj[16]'])
def UniformBufferStruct.alignment; Mat4.alignment; end
$ubo = UniformBufferStruct.new(CGLM.alloc(UniformBufferStruct))
$model_matrix       = Mat4.new(addr: $ubo.to_ptr + UniformBufferStruct.offsetof('model'))
$view_matrix        = Mat4.new(addr: $ubo.to_ptr + UniformBufferStruct.offsetof('view'))
$projection_matrix  = Mat4.new(addr: $ubo.to_ptr + UniformBufferStruct.offsetof('proj'))

obj = TinyOBJ.load(File.expand_path('models/viking_room.obj', __dir__))
NUM_INDICES = obj.num_indices
Vertex = Vulkan.struct(['float pos[3]', 'float color[3]', 'float texcoords[2]'])
IndexData = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT * NUM_INDICES)
VertexData = Fiddle::Pointer.malloc(Vertex.size * obj.num_distinct_vertices)
obj.fill_buffers index_type:    :uint32,
                 index_stride:  Fiddle::SIZEOF_INT,
                 vertex_stride: Vertex.size,
                 flip_v:        true,
                 indices:       IndexData,
                 positions:     VertexData,
                 colors:        VertexData + Vertex.offsetof('color'),
                 texcoords:     VertexData + Vertex.offsetof('texcoords')

# Create a window that we plan to draw to
SDL2.init(SDL2::INIT_EVERYTHING)
window = SDL2::Window.create "test-vulkan", 0, 0, 640, 480, SDL2::Window::Flags::VULKAN |
                                                            SDL2::Window::Flags::RESIZABLE |
                                                            0x00002000 # SDL2::Window::Flags::ALLOW_HIGHDPI

# Create a Vulkan instance
instance = Vulkan::Instance.new extensions: window.vk_instance_extensions

# Create a rendering surface
surface = instance.create_window_surface(window)

# Choose an adequate physical device
dev = instance.physical_devices.detect do |dev|
  next false unless swapchain_surface_info = dev.swapchain_surface_info(surface)
  builder = Vulkan::SwapchainBuilder.new(swapchain_surface_info)
  dev.properties[:device_type] == :discrete_gpu &&
    (builder.format rescue false) && (builder.presentation_mode rescue false)
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
staging_buffer = device.create_buffer size: VertexData.size, usage: :transfer_src
staging_buffer.map { |data| data[0, VertexData.size] = VertexData[0, VertexData.size] }
VertexBuffer = device.create_buffer size: VertexData.size,
                                    usage: [ :transfer_dst, :vertex_buffer ],
                                    properties: :device_local
vertex_transfer_buffer = command_pool.create_command_buffer(usage: :one_time_submit) { |cmd| cmd.copy_buffer staging_buffer, VertexBuffer }

# Populate the index buffer
staging_buffer = device.create_buffer size: IndexData.size, usage: :transfer_src
staging_buffer.map { |data| data[0, IndexData.size] = IndexData[0, IndexData.size] }
IndexBuffer = device.create_buffer size: IndexData.size,
                                   usage: [ :transfer_dst, :index_buffer ],
                                   properties: :device_local
index_transfer_buffer = command_pool.create_command_buffer(usage: :one_time_submit) { |cmd| cmd.copy_buffer staging_buffer, IndexBuffer }

# Submit both transfers and wait for them to complete
graphics_queue.submit([vertex_transfer_buffer, index_transfer_buffer])
# graphics_queue.wait_until_idle

UniformBuffers = []

png = ChunkyPNG::Image.from_file(File.expand_path('textures/viking_room.png', __dir__))
num_mip_levels = Vulkan.num_mip_levels(png.width, png.height)
texture = device.create_image dimensions: 2,
                              width: png.width,
                              height: png.height,
                              depth: 1,
                              mip_levels: num_mip_levels,
                              array_layers: 1,
                              format: :r8g8b8a8_unorm,
                              tiling: :optimal,
                              initial_layout: :undefined,
                              usage: [:transfer_dst, :sampled],
                              sharing: :exclusive,
                              samples: 1
texture.transition_layout command_pool, graphics_queue, to: :transfer_dst_optimal
num_mip_levels.times do |mip_level|
  image_data = png.to_rgba_stream
  image_data_buffer = device.create_buffer size: image_data.size,
                                           usage: :transfer_src,
                                           properties: [:host_visible, :host_coherent]
  image_data_buffer.map { |data| data[0, image_data.size] = image_data }
  texture.copy_from_buffer  command_pool, graphics_queue, buffer: image_data_buffer,
                                                          width: png.width,
                                                          height: png.height,
                                                          mip_level: mip_level
  png.resample_bilinear! png.width  == 1 ? png.width  : png.width  / 2,
                         png.height == 1 ? png.height : png.height / 2
end
graphics_queue.wait_until_idle
texture.transition_layout command_pool, graphics_queue, to: :shader_ro_optimal
texture_view = texture.create_view
sampler = device.create_sampler max_lod: num_mip_levels#, min_lod: num_mip_levels / 2

shader_stages = [
  device.create_shader_stage(file_path: File.expand_path('./shaders/model_loading.vert.spv', __dir__),
                             stage: Vulkan::VK_SHADER_STAGE_VERTEX_BIT),
  device.create_shader_stage(file_path: File.expand_path('./shaders/model_loading.frag.spv', __dir__),
                             stage: Vulkan::VK_SHADER_STAGE_FRAGMENT_BIT)
]

rebuild_swap_chain = proc do
  # Create a swapchain for image presentation
  $swapchain = device.create_swapchain surface: surface,
                                       surface_width: window.vk_drawable_size[0],
                                       surface_height: window.vk_drawable_size[1]
  
  depth_format = device.physical_device.detect_supported_format(
                   :d32_sfloat, :d32_sfloat_s8_uint, :d24_unorm_s8_uint,
                   usage: :depth_stencil_attachment,
                   tiling: :optimal
                 )

  color_image = device.create_image dimensions: 2,
                                    width: $swapchain.width,
                                    height: $swapchain.height,
                                    depth: 1,
                                    format: $swapchain.format,
                                    usage: [:transient_attachment, :color_attachment],
                                    samples: device.max_samples
  color_image_view = color_image.create_view
  color_image.transition_layout command_pool, graphics_queue, to: :color_attachment_optimal

  depth_image = device.create_image dimensions: 2,
                                    width: $swapchain.width,
                                    height: $swapchain.height,
                                    depth: 1,
                                    format: depth_format,
                                    usage: [:depth_stencil_attachment],
                                    samples: device.max_samples
  depth_image_view = depth_image.create_view aspects: :depth
  depth_image.transition_layout command_pool, graphics_queue, to: :depth_stencil_attachment_optimal,
                                                              aspects: :depth

  # Create render pass with one subpass
  render_pass = device.create_renderpass
  subpass = render_pass.add_subpass
  subpass.add_color_attachment_ref index: render_pass.add_attachment(format: $swapchain.format,
                                                                     final_layout: :color_attachment_optimal,
                                                                     samples: device.max_samples)
  subpass.set_depth_stencil_attachment_ref index: render_pass.add_attachment(format: depth_format,
                                                                             samples: device.max_samples,
                                                                             load_op: :clear,
                                                                             store_op: :dont_care,
                                                                             stencil_load_op: :dont_care,
                                                                             stencil_store_op: :dont_care,
                                                                             initial_layout: nil,
                                                                             final_layout: :depth_stencil_attachment)
  # subpass.add_color_attachment_ref index: render_pass.add_attachment(format: $swapchain.format,
  #                                                                    final_layout: :presentation_src)
  subpass.add_resolve_attachment_ref index: render_pass.add_attachment(format: $swapchain.format,
                                                                       final_layout: :presentation_src,
                                                                       load_op: :dont_care)
  render_pass.commit

  # Create a framebuffer for each image in the swap chain, and associate each with the depth image
  framebuffers = $swapchain.image_views.map do |swapchain_image_view|
    device.create_framebuffer(width: $swapchain.width,
                              height: $swapchain.height,
                              render_pass: render_pass,
                              attachments: [color_image_view,
                                            depth_image_view,
                                            swapchain_image_view])
  end

  # Create graphic pipeline
  pipeline = device.create_pipeline(viewport: { width: $swapchain.width, height: $swapchain.height })
  pipeline.multisampling[:samples]        = device.max_samples
  pipeline.multisampling[:sample_shading] = true
  pipeline.depth
  pipeline.add_binding_description binding: 0,
                                   stride: Vertex.size,
                                   input_rate: :vertex

  pipeline.add_attribute_description binding: 0,
                                     location: 0,
                                     format: :r32g32b32_sfloat,
                                     offset: 0

  pipeline.add_attribute_description binding: 0,
                                     location: 1,
                                     format: :r32g32b32_sfloat,
                                     offset: Fiddle::SIZEOF_FLOAT * 3

  pipeline.add_attribute_description binding: 0,
                                     location: 2,
                                     format: :r32g32_sfloat,
                                     offset: Fiddle::SIZEOF_FLOAT * 6

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
      cmd.bind_index_buffer(IndexBuffer, type: :uint32)
      cmd.bind_descriptor_set(:graphics, descriptor_sets[index], pipeline_layout: pipeline.layout)
      cmd.draw_indexed(NUM_INDICES, 1, 0, 0, 0)
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

Mat4.look_at Vec3.new([2, 2, 2]), Vec3.zero, Vec3.new([0, 0, 1]), $view_matrix
Mat4.perspective $projection_matrix, fovy: 45.to_radians,
                                     aspect: $swapchain.width.to_f / $swapchain.height.to_f,
                                     near: 0.1,
                                     far: 10
# Convert OpenGL projection matrix into Vulkan projection matrix
# (e.g. NDC from z=-1..1 to z=0..1, and flip y)
$projection_matrix.mul_mat4 Mat4.new([Vec4.new([1.0,  0.0, 0.0,  0.0]),
                                      Vec4.new([0.0, -1.0, 0.0,  0.0]),
                                      Vec4.new([0.0,  0.0, 0.5, -0.5]),
                                      Vec4.new([0.0,  0.0, 0.0,  1.0])]),
                            $projection_matrix
UniformBuffers.each { |b| b.map { |data| data[0, UniformBufferStruct.size] = $ubo[0, UniformBufferStruct.size] } }

# Begin main event loop & drawing
until done
  frame_counter += 1
  break if ENV['MAX_FRAMES'].to_i == frame_counter
  # dump some FPS infos
  uptime = ENV['TIME_STEP'] ? ENV['TIME_STEP'].to_f * frame_counter : Time.now - start_time
  if frame_counter % 1000 == 0
    fps = frame_counter / uptime
    p ['fps: ', fps, 'frame-time (ms): ', 1000.0 / fps]
  end
  while event = SDL2::Event.poll
    case event
    when SDL2::Event::Quit then done = true
    when SDL2::Event::Window::RESIZED then rebuild_swap_chain.call
    end
  end

  begin
    in_flight_fences[current_frame].wait
    image_index = $swapchain.next_image_index(semaphore: image_available_semaphores[current_frame])
    UniformBuffers[image_index].map do |data|
      Mat4.identity $model_matrix
      $model_matrix.rotate! Vec3.new([0, 0, 1]), uptime * 0.25 * 90.to_radians
      data[0, Mat4.size] = $model_matrix.addr[0, Mat4.size]
    end
    in_flight_fences[current_frame].reset
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
