module Vulkan
  class Image
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    attr_reader :dimensions
    attr_reader :width
    attr_reader :height
    attr_reader :depth
    attr_reader :mip_levels
    attr_reader :array_layers
    attr_reader :format
    attr_reader :tiling
    attr_reader :initial_layout
    attr_reader :layout
    attr_reader :usage
    attr_reader :sharing
    attr_reader :samples
    attr_reader :memory

    # You should only set this if you have transitioned the image to a
    # different layout outside of this class, by working directly with
    # a command buffer.
    attr_writer :layout

    def initialize(vk, physical_device,
                       dimensions: ,
                       width: ,
                       height: ,
                       depth: ,
                       mip_levels:     1,
                       array_layers:   1,
                       format:         :r8g8b8a8_unorm,
                       tiling:         :optimal,
                       initial_layout: :undefined,
                       usage:          [:transfer_dst, :sampled],
                       sharing:        :exclusive,
                       samples:        1,
                       flags:          [],
                       properties:     :device_local)
      @vk             = vk
      @dimensions     = dimensions
      @width          = width
      @height         = height
      @depth          = depth
      @mip_levels     = mip_levels
      @array_layers   = array_layers
      @format         = format
      @tiling         = tiling
      @initial_layout = @layout = initial_layout
      @usage          = usage
      @sharing        = sharing
      @samples        = samples
      image_info = VkImageCreateInfo.malloc
      image_info.sType         = VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO
      image_info.imageType     = sym_to_image_type((1..3).include?(dimensions) ? :"#{dimensions}d" : dimensions)
      image_info.extent.width  = width
      image_info.extent.height = height
      image_info.extent.depth  = depth
      image_info.mipLevels     = mip_levels
      image_info.arrayLayers   = array_layers
      image_info.format        = sym_to_image_format(format)
      image_info.tiling        = sym_to_image_tiling(tiling)
      image_info.initialLayout = sym_to_image_layout(initial_layout)
      image_info.usage         = syms_to_image_usage_flags(usage)
      image_info.sharingMode   = sym_to_sharing_mode(sharing)
      image_info.samples       = sym_to_samples(samples)
      image_info.flags         = syms_to_image_create_flags(flags)
      handle_p = Vulkan.create_value('VkImage')
      check_result @vk.vkCreateImage(@vk.device, image_info, nil, handle_p)
      @handle = handle_p.value
      @memory = Vulkan::ImageMemory.new(@vk, physical_device, owner: self, properties: properties)
      finalize_with @vk, :vkDestroyImage, @vk.device, @handle, nil
    end

    def create_view(format: self.format,
                    base_mip_level: 0,
                    level_count: mip_levels - base_mip_level,
                    base_array_layer: 0,
                    layer_count: array_layers - base_array_layer,
                    aspects: :color,
                    **other_image_view_args)
      ImageView.new(@vk, self, format,
                    base_mip_level:   base_mip_level,
                    level_count:      level_count,
                    base_array_layer: base_array_layer,
                    layer_count:      layer_count,
                    aspects:          aspects,
                    **other_image_view_args)
    end

    def detect_transition_access_and_stage_flags(from, to)
      from, to = sym_to_image_layout(from), sym_to_image_layout(to)
      if from == VK_IMAGE_LAYOUT_UNDEFINED &&
         to   == VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL
        return {
          src_access: 0,
          dst_access: :transfer_write,
          src_stages: :top_of_pipe,
          dst_stages: :transfer,
          dependencies: 0
        }
      elsif from == VK_IMAGE_LAYOUT_UNDEFINED &&
            to   == VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
        return {
          src_access:   0,
          dst_access:   :shader_read,
          src_stages:   :color_attachment_output,
          dst_stages:   :fragment_shader,
          dependencies: 0
        }
      elsif from == VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL &&
            to   == VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
        return {
          src_access:   :transfer_write,
          dst_access:   :shader_read,
          src_stages:   :transfer,
          dst_stages:   :fragment_shader,
          dependencies: 0
        }
      elsif from == VK_IMAGE_LAYOUT_UNDEFINED &&
            to   == VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
        return {
          src_access: 0,
          dst_access: [ :depth_stencil_attachment_read, :depth_stencil_attachment_write ],
          src_stages: :top_of_pipe,
          dst_stages: :early_fragment_tests,
          dependencies: 0
        }
      elsif from == VK_IMAGE_LAYOUT_UNDEFINED &&
            to   == VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
        return {
          src_access: 0,
          dst_access: [ :color_attachment_read, :color_attachment_write ],
          src_stages: :top_of_pipe,
          dst_stages: :color_attachment_output,
          dependencies: 0
        }
      else
        raise ArgumentError, "unsupported layout transition (%s to %s)!" % [from.inspect, to.inspect]
      end
    end

    # Transitions the layout for this image using the given command buffer.
    # Does not submit the command buffer. Use #transition_layout if you want
    # to be sure the image has fully transitioned before continuing.
    def transition_layout_using(cmd,
                                from: self.layout,
                                to:,
                                src_queue_family: nil,
                                dst_queue_family: nil,
                                base_mip_level: 0,
                                level_count: mip_levels - base_mip_level,
                                base_array_layer: 0,
                                layer_count: array_layers - base_array_layer,
                                aspects: :color)
      access_opts = detect_transition_access_and_stage_flags(from, to)
      cmd.pipeline_image_barrier from_layout:      from,
                                 to_layout:        to,
                                 src_queue_family: src_queue_family,
                                 dst_queue_family: dst_queue_family,
                                 image:            self,
                                 aspects:          aspects,
                                 base_mip_level:   base_mip_level,
                                 level_count:      level_count,
                                 base_array_layer: base_array_layer,
                                 layer_count:      layer_count,
                                 **access_opts
      @layout = to
    end

    # Transitions the layout for this image, using the given command pool to
    # allocate a command buffer and using the given queue to submit it. If
    # `wait_until_idle` is true, this method will block until the queue is
    # idle. Otherwise, it will return as soon as the command buffer is
    # submitted. See #transition_layout_with for other arguments.
    def transition_layout(command_pool, queue, wait_until_idle: true, **other_args)
      command_buffer = command_pool.create_command_buffer(usage: :one_time_submit) do |cmd|
        transition_layout_using(cmd, **other_args)
      end
      queue.submit([command_buffer])
      queue.wait_until_idle if wait_until_idle
    end

    def copy_from_buffer(command_pool, queue,
                         buffer:,
                         buffer_offset: 0,
                         buffer_row_length: 0,
                         buffer_image_height: 0,
                         x: 0,
                         y: 0,
                         z: 0,
                         width: self.width - x,
                         height: self.height - y,
                         depth: self.depth - z,
                         aspects: :color,
                         mip_level: 0,
                         base_array_layer: 0,
                         layer_count: array_layers - base_array_layer,
                         wait_until_idle: true)
      command_buffer = command_pool.create_command_buffer(usage: :one_time_submit) do |cmd|
        cmd.copy_buffer_to_image buffer, self, [
                                   buffer_offset:       buffer_offset,
                                   buffer_row_length:   buffer_row_length,
                                   buffer_image_height: buffer_image_height,
                                   x:                   x,
                                   y:                   y,
                                   z:                   z,
                                   width:               width,
                                   height:              height,
                                   depth:               depth,
                                   aspects:             aspects,
                                   mip_level:           mip_level,
                                   base_array_layer:    base_array_layer,
                                   layer_count:         layer_count
                                 ]
      end

      queue.submit([command_buffer])
      queue.wait_until_idle if wait_until_idle
    end

    # See CommandBuffer#blit_image for details. If `:wait_until_idle` is true,
    # this method won't return until the blit operation has completed and its
    # queue is idle.
    def blit_from(command_pool, queue,
                  src:,
                  src_layout: :transfer_src_optimal,
                  dst_layout: :transfer_dst_optimal,
                  regions:,
                  filter: :nearest,
                  wait_until_idle: false)
      command_buffer = command_pool.create_command_buffer(usage: :one_time_submit) do |cmd|
        cmd.blit_image src_image: src,
                       src_image_layout: src_layout,
                       dst_image: self,
                       dst_image_layout: dst_layout,
                       regions: regions,
                       filter: filter
      end

      queue.submit([command_buffer])
      queue.wait_until_idle if wait_until_idle
    end

    def map(*args, &block)
      memory.map(*args, &block)
    end

    def mapped?
      memory.mapped?
    end

    def unmap
      memory.unmap
    end

    def data
      memory.data
    end
  end
end
