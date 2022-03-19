module Vulkan
  class CommandBuffer
    extend Vulkan::Checks
    extend Vulkan::Conversions
    include Vulkan::Checks
    include Vulkan::Conversions

    class << self
      def create(vk, command_pool, count: 1, level: :primary, usage: :simultaneous, &block)
        @usage = usage

        alloc_info = VkCommandBufferAllocateInfo.malloc
        alloc_info.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO
        alloc_info.commandPool = command_pool.to_ptr
        alloc_info.level = sym_to_command_buffer_level(level)
        alloc_info.commandBufferCount = count

        buffers = Vulkan.struct(["void *value[#{count}]"]).malloc
        check_result vk.vkAllocateCommandBuffers(vk.device, alloc_info, buffers)
        count.times.map { |i| new(vk, buffers.value[i], i, &block) }
      end
    end

    def initialize(vk, handle, index = 0, &block)
      @vk = vk
      @handle = handle
      @recording = false
      @scissors_p = {}
      record(index, &block) if block_given?
    end

    def record(user_arg = nil)
      start_recording
      yield self, user_arg
    ensure
      stop_recording
    end

    def start_recording
      @begin_info = VkCommandBufferBeginInfo.malloc
      @begin_info.sType            = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO
      @begin_info.flags            = sym_to_command_buffer_usage(@usage)
      @begin_info.pInheritanceInfo = nil
      check_result @vk.vkBeginCommandBuffer(to_ptr, @begin_info)
      @recording = true

      # references we don't want to let go of, in case of garbage collection
      @refs = []
    end

    def recording?
      @recording
    end

    def stop_recording
      if recording?
        check_result @vk.vkEndCommandBuffer(to_ptr)
        @recording = false
      end
    end

    def render_pass(render_pass, **args)
      begin_render_pass(render_pass, **args)
      yield self if block_given?
    ensure
      end_render_pass
    end

    def copy_buffer(src, dst, regions: [{size: src.size}])
      @copy_buffer_copy_regions_p ||= {}
      copy_regions_p = @copy_buffer_copy_regions_p[regions.size] ||=
                       Vulkan.struct("regions[#{regions.size}]" => VkBufferCopy).malloc
      # @refs << copy_regions_p
      regions.each_with_index do |region, i|
        copy_regions_p.regions[i].srcOffset = region[:src_offset] if region[:src_offset]
        copy_regions_p.regions[i].dstOffset = region[:dst_offset] if region[:dst_offset]
        copy_regions_p.regions[i].size      = region[:size] || raise(ArgumentError, 'region[:size] is required')
      end
      @vk.vkCmdCopyBuffer(to_ptr, src, dst, regions.size, copy_regions_p)
    end

    # Blit from the image at `:src` into the image at `:dst`.
    # `:regions` contains an array of hashes, which must correspond to
    # this layout (values given are defaults used if the field is omitted):
    #
    #     {
    #       src: { # corresponds to struct VkImageSubresourceLayers
    #         aspect_mask: VK_IMAGE_ASPECT_FLAG_BITS_MAX_ENUM, # (everything)
    #         mip_level: (required),
    #         base_array_layer: 0,
    #         layer_count: 1,
    #         tl: { # corresponds to srcOffests[0], a struct VkOffset3D
    #           x: 0,
    #           y: 0,
    #           z: 0
    #         },
    #         br: { # corresponds to srcOffests[1], a struct VkOffset3D
    #           x: (required)
    #           y: (required)
    #           z: (required)
    #         }
    #       },
    #       dst: { # corresponds to struct VkImageSubresourceLayers
    #         aspect_mask: VK_IMAGE_ASPECT_FLAG_BITS_MAX_ENUM, # (everything)
    #         mip_level: (required),
    #         base_array_layer: 0,
    #         layer_count: 1,
    #         tl: { # corresponds to dstOffests[0], a struct VkOffset3D
    #           x: 0,
    #           y: 0,
    #           z: 0
    #         },
    #         br: { # corresponds to dstOffests[1], a struct VkOffset3D
    #           x: (required)
    #           y: (required)
    #           z: (required)
    #         }
    #       },
    #     }
    def blit_image(src:,
                   src_layout: :transfer_src_optimal,
                   dst:,
                   dst_layout: :transfer_dst_optimal,
                   regions:,
                   filter: :nearest)
      blit_regions_p = Vulkan.struct("regions[#{regions.size}]" => VkImageBlit).malloc
      @refs << blit_regions_p
      regions.each_with_index do |region, i|
        blit_region = blit_regions_p.regions[i]
        blit_region.srcSubresource.aspectMask     = syms_to_image_aspect_flags(region[:src][:aspect_mask] || VK_IMAGE_ASPECT_FLAG_BITS_MAX_ENUM)
        blit_region.srcSubresource.mipLevel       = region[:src][:mip_level]
        blit_region.srcSubresource.baseArrayLayer = region[:src][:base_array_layer] || 0
        blit_region.srcSubresource.layerCount     = region[:src][:layer_count] || 1
        blit_region.dstSubresource.aspectMask     = syms_to_image_aspect_flags(region[:dst][:aspect_mask] || VK_IMAGE_ASPECT_FLAG_BITS_MAX_ENUM)
        blit_region.dstSubresource.mipLevel       = region[:dst][:mip_level]
        blit_region.dstSubresource.baseArrayLayer = region[:dst][:base_array_layer] || 0
        blit_region.dstSubresource.layerCount     = region[:dst][:layer_count] || 1
        tl = region[:src][:tl] || {}
        blit_region.srcOffsets[0].x = tl[:x] || 0
        blit_region.srcOffsets[0].y = tl[:y] || 0
        blit_region.srcOffsets[0].z = tl[:z] || 0
        blit_region.srcOffsets[1].x = region[:src][:br][:x] || raise(ArgumentError, "Need src :br offsets (x)")
        blit_region.srcOffsets[1].y = region[:src][:br][:y] || raise(ArgumentError, "Need src :br offsets (y)")
        blit_region.srcOffsets[1].z = region[:src][:br][:z] || raise(ArgumentError, "Need src :br offsets (z)")
        tl = region[:dst][:tl] || {}
        blit_region.dstOffsets[0].x = tl[:x] || 0
        blit_region.dstOffsets[0].y = tl[:y] || 0
        blit_region.dstOffsets[0].z = tl[:z] || 0
        blit_region.dstOffsets[1].x = region[:dst][:br][:x] || raise(ArgumentError, "Need dst :br offsets (x)")
        blit_region.dstOffsets[1].y = region[:dst][:br][:y] || raise(ArgumentError, "Need dst :br offsets (y)")
        blit_region.dstOffsets[1].z = region[:dst][:br][:z] || raise(ArgumentError, "Need dst :br offsets (z)")
      end

      @vk.vkCmdBlitImage(to_ptr,
                          src,
                          sym_to_image_layout(src_layout),
                          dst,
                          sym_to_image_layout(dst_layout),
                          regions.size,
                          blit_regions_p,
                          sym_to_filter(filter))
    end

    def pipeline_image_barrier(from_layout:,
                               to_layout:,
                               src_queue_family: :ignored,
                               dst_queue_family: :ignored,
                               image:,
                               aspects:,
                               base_mip_level:,
                               level_count:,
                               base_array_layer:,
                               layer_count:,
                               src_access:,
                               dst_access:,
                               **barrier_args)
      barrier = VkImageMemoryBarrier.malloc
      barrier.sType                           = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER
      barrier.oldLayout                       = sym_to_image_layout(from_layout)
      barrier.newLayout                       = sym_to_image_layout(to_layout)
      barrier.srcQueueFamilyIndex             = queue_family_to_index(src_queue_family)
      barrier.dstQueueFamilyIndex             = queue_family_to_index(dst_queue_family)
      barrier.image                           = image.to_ptr
      barrier.subresourceRange.aspectMask     = syms_to_image_aspect_flags(aspects)
      barrier.subresourceRange.baseMipLevel   = base_mip_level
      barrier.subresourceRange.levelCount     = level_count
      barrier.subresourceRange.baseArrayLayer = base_array_layer
      barrier.subresourceRange.layerCount     = layer_count
      barrier.srcAccessMask                   = syms_to_access_mask(src_access)
      barrier.dstAccessMask                   = syms_to_access_mask(dst_access)
      pipeline_barriers(image_barriers: [barrier], **barrier_args)
    end

    def pipeline_barriers(memory_barriers: nil,
                          buffer_barriers: nil,
                          image_barriers: nil,
                          src_stages: ,
                          dst_stages: ,
                          dependencies: 0)
      memory_barriers_p = array_of_structures(memory_barriers)
      buffer_barriers_p = array_of_structures(buffer_barriers)
      image_barriers_p  = array_of_structures(image_barriers)
      @vk.vkCmdPipelineBarrier to_ptr,
                               syms_to_pipeline_stage_flags(src_stages),
                               syms_to_pipeline_stage_flags(dst_stages),
                               syms_to_dependency_flags(dependencies),
                               memory_barriers&.size || 0,
                               memory_barriers_p,
                               buffer_barriers&.size || 0,
                               buffer_barriers_p,
                               image_barriers&.size || 0,
                               image_barriers_p
    end

    def set_scissor(scissors, first: 0)
      scissors_p = @scissors_p[scissors.size] ||=
                   Vulkan.struct("scissors[#{scissors.size}]" => VkRect2D).malloc
      scissors.each_with_index do |scissor, i|
        scissors_p.scissors[i].offset.x      = scissor[:left]
        scissors_p.scissors[i].offset.y      = scissor[:top]
        scissors_p.scissors[i].extent.width  = scissor[:width]
        scissors_p.scissors[i].extent.height = scissor[:height]
      end
      @vk.vkCmdSetScissor(to_ptr, first, scissors.size, scissors_p)
    end

    def begin_render_pass(render_pass, framebuffer:,
                                       left: 0,
                                       top: 0,
                                       width: framebuffer.width,
                                       height: framebuffer.height,
                                       clear: nil,
                                       subpass_contents: :inline)
      attachments = render_pass.attachments
      @refs << render_pass
      @refs << framebuffer
      @clear_values = attachments.size.times.map { VkClearValue.malloc }
      attachments.each_with_index do |attachment, i|
        clear_i = clear && clear[i]
        if attachments[i].finalLayout == VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL ||
           attachments[i].finalLayout == VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL
          clear_i ||= [1, 0]
          @clear_values[i].depthStencil.depth   = clear_i[0]
          @clear_values[i].depthStencil.stencil = clear_i[1]
        else
          clear_i ||= [0, 0, 0, 1]
          # FIXME use attachment.format (one of VK_FORMAT_*) to determine which
          # accessor to use here
          @clear_values[i].color.float32 = clear_i
        end
      end
      @clear_values_p = array_of_structures(@clear_values)
      @render_pass_info = VkRenderPassBeginInfo.malloc
      @render_pass_info.sType = VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO
      @render_pass_info.renderPass = render_pass.to_ptr
      @render_pass_info.framebuffer = framebuffer.to_ptr
      @render_pass_info.renderArea.offset.x = left
      @render_pass_info.renderArea.offset.y = top
      @render_pass_info.renderArea.extent.width = width
      @render_pass_info.renderArea.extent.height = height
      @render_pass_info.clearValueCount = attachments.size
      @render_pass_info.pClearValues = @clear_values_p
      @vk.vkCmdBeginRenderPass(to_ptr, @render_pass_info, sym_to_subpass_contents(subpass_contents))
    end

    def end_render_pass
      @vk.vkCmdEndRenderPass(to_ptr)
    end

    def bind_pipeline(binding_point, pipeline)
      @refs << pipeline
      @vk.vkCmdBindPipeline(to_ptr, sym_to_pipeline_bind_point(binding_point), pipeline)
    end

    def copy_buffer_to_image(buffer, image, regions, layout: :dst_optimal)
      regions = [regions].flatten
      regions_p = regions.map { |region| build_buffer_image_copy_region(**region) }
      @vk.vkCmdCopyBufferToImage to_ptr,
                                 buffer.respond_to?(:to_ptr) ? buffer.to_ptr : buffer,
                                 image.respond_to?(:to_ptr)  ? image.to_ptr  : image,
                                 sym_to_image_layout(layout),
                                 regions.size,
                                 array_of_structures(regions_p)
    end

    def build_buffer_image_copy_region(buffer_offset:,
                                       buffer_row_length:,
                                       buffer_image_height:,
                                       x:,
                                       y:,
                                       z:,
                                       width:,
                                       height:,
                                       depth:,
                                       aspects:,
                                       mip_level:,
                                       base_array_layer:,
                                       layer_count:)
      VkBufferImageCopy.malloc.tap do |region|
        region.bufferOffset                    = buffer_offset
        region.bufferRowLength                 = buffer_row_length
        region.bufferImageHeight               = buffer_image_height
        region.imageSubresource.aspectMask     = syms_to_image_aspect_flags(aspects)
        region.imageSubresource.mipLevel       = mip_level
        region.imageSubresource.baseArrayLayer = base_array_layer
        region.imageSubresource.layerCount     = layer_count
        region.imageOffset.x                   = x
        region.imageOffset.y                   = y
        region.imageOffset.z                   = z
        region.imageExtent.width               = width
        region.imageExtent.height              = height
        region.imageExtent.depth               = depth
      end
    end

    def bind_vertex_buffer(vertex_buffer, binding_index: 0, offset: 0)
      bind_vertex_buffers vertex_buffers: [vertex_buffer],
                          first_binding: binding_index,
                          offsets: [offset]
    end

    def bind_vertex_buffers(vertex_buffers:,
                            offsets: nil,
                            first_binding: 0,
                            binding_count: vertex_buffers.size)
      offsets ||= vertex_buffers.map { 0 }
      @refs.concat vertex_buffers
      buffers_p = array_of_pointers(vertex_buffers)
      @bind_vertex_buffers_offsets_p ||= {}
      offsets_p = @bind_vertex_buffers_offsets_p[offsets.size] ||=
                  Vulkan.struct("VkDeviceSize offsets[#{offsets.size}]").malloc
      offsets.each_with_index { |o, i| offsets_p.offsets[i] = o }
      @vk.vkCmdBindVertexBuffers(to_ptr, first_binding, binding_count, buffers_p, offsets_p)
    end

    def bind_index_buffer(index_buffer, offset: 0, type:)
      @refs << index_buffer
      @vk.vkCmdBindIndexBuffer(to_ptr, index_buffer, offset, sym_to_index_type(type))
    end

    def bind_descriptor_sets(bind_point, sets, pipeline_layout:,
                                               set_count: sets.size,
                                               first_set: 0,
                                               dynamic_offsets: nil,
                                               dynamic_offset_count: dynamic_offsets ? dynamic_offsets.size : 0)
      @refs << sets
      @vk.vkCmdBindDescriptorSets(to_ptr,
                                  sym_to_pipeline_bind_point(bind_point),
                                  pipeline_layout,
                                  first_set,
                                  set_count,
                                  array_of_pointers(sets),
                                  dynamic_offset_count,
                                  dynamic_offsets);
    end

    def bind_descriptor_set(bind_point, set, pipeline_layout:)
      bind_descriptor_sets(bind_point, [set], pipeline_layout: pipeline_layout)
    end

    def draw(vertex_count, instance_count, first_vertex_index, first_instance_index)
      @vk.vkCmdDraw(to_ptr, vertex_count, instance_count, first_vertex_index, first_instance_index)
    end

    def draw_indexed(index_count, instance_count, first_index, vertex_offset, first_instance)
      @vk.vkCmdDrawIndexed(to_ptr, index_count, instance_count, first_index, vertex_offset, first_instance)
    end

    def viewport(x, y, width, height, min_depth = 0, max_depth = 1)
      vp = VkViewport.malloc
      vp.x = x
      vp.y = y
      vp.width = width
      vp.height = height
      vp.minDepth = min_depth
      vp.maxDepth = max_depth
      @vk.vkCmdSetViewport(to_ptr, 0, 1, vp)
    end

    def to_ptr
      @handle
    end
  end
end
