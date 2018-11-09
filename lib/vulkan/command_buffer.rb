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
      copy_regions_p = Vulkan.struct("regions[#{regions.size}]" => VkBufferCopy).malloc
      @refs << copy_regions_p
      regions.each_with_index do |region, i|
        copy_regions_p.regions[i].srcOffset = region[:src_offset] if region[:src_offset]
        copy_regions_p.regions[i].dstOffset = region[:dst_offset] if region[:dst_offset]
        copy_regions_p.regions[i].size      = region[:size] || raise(ArgumentError, 'region[:size] is required')
      end
      @vk.vkCmdCopyBuffer(to_ptr, src, dst, regions.size, copy_regions_p)
    end

    def begin_render_pass(render_pass, framebuffer:,
                                       left: 0,
                                       top: 0,
                                       width: framebuffer.width,
                                       height: framebuffer.height,
                                       clear_color: [0, 0, 0, 1],
                                       subpass_contents: :inline)
      # FIXME
      @clear_color_p = VkClearValue.malloc
      # p clear_color_p.color.to_ptr
      # clear_color_p.color[0] = clear_color[0]
      # clear_color_p.color[1] = clear_color[1]
      # clear_color_p.color[2] = clear_color[2]
      # clear_color_p.color[3] = clear_color[3]
      @render_pass_info = VkRenderPassBeginInfo.malloc
      @render_pass_info.sType = VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO
      @render_pass_info.renderPass = render_pass.to_ptr
      @render_pass_info.framebuffer = framebuffer.to_ptr
      @render_pass_info.renderArea.offset.x = left
      @render_pass_info.renderArea.offset.y = top
      @render_pass_info.renderArea.extent.width = width
      @render_pass_info.renderArea.extent.height = height
      @render_pass_info.clearValueCount = 1
      @render_pass_info.pClearValues = @clear_color_p
      @vk.vkCmdBeginRenderPass(to_ptr, @render_pass_info, sym_to_subpass_contents(subpass_contents))
    end

    def end_render_pass
      @vk.vkCmdEndRenderPass(to_ptr)
    end

    def bind_pipeline(binding_point, pipeline)
      @refs << pipeline
      @vk.vkCmdBindPipeline(to_ptr, sym_to_pipeline_bind_point(binding_point), pipeline)
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
      offsets_p = Vulkan.struct("VkDeviceSize offsets[#{offsets.size}]").malloc
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

    def to_ptr
      @handle
    end
  end
end
