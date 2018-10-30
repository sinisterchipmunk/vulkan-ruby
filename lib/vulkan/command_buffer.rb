module Vulkan
  class CommandBuffer
    extend Vulkan::Checks
    extend Vulkan::Conversions
    include Vulkan::Checks
    include Vulkan::Conversions

    class << self
      def create(vk, command_pool, count: 1, level: :primary, &block)
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
      @begin_info.flags            = VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT
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

    def draw(vertex_count, instance_count, first_vertex_index, first_instance_index)
      @vk.vkCmdDraw(to_ptr, vertex_count, instance_count, first_vertex_index, first_instance_index)
    end

    # def submit(queue, wait_semaphores: [], wait_stages: [], signal_semaphores: [], fence: nil)
    #   wait_stages_p = @wait_stages_buffers[wait_stages.size] ||= Vulkan.struct(["VkPipelineStageFlags stages[#{wait_stages.size}]"]).malloc
    #   wait_stages.each_with_index { |stage, index| wait_stages_p.stages[index] = stage }

    #   wait_semaphores_p = @wait_semaphores_buffers[wait_semaphores.size] ||= Fiddle::Pointer.malloc(wait_semaphores.size * Fiddle::SIZEOF_VOIDP)
    #   array_of_pointers(wait_semaphores, wait_semaphores_p)

    #   signal_semaphores_p = @signal_semaphores_buffers[signal_semaphores.size] ||= Fiddle::Pointer.malloc(signal_semaphores.size * Fiddle::SIZEOF_VOIDP)
    #   array_of_pointers(signal_semaphores, signal_semaphores_p)

    #   @submit_info.waitSemaphoreCount   = wait_semaphores.size
    #   @submit_info.pWaitSemaphores      = wait_semaphores_p
    #   @submit_info.pWaitDstStageMask    = wait_stages_p
    #   @submit_info.commandBufferCount   = 1
    #   @submit_info.pCommandBuffers      = @self_p
    #   @submit_info.signalSemaphoreCount = signal_semaphores.size
    #   @submit_info.pSignalSemaphores    = signal_semaphores_p
    #   check_result @vk.vkQueueSubmit(queue, 1, @submit_info, fence)
    # end

    # def present(swapchain, image_index, queue)
    #   @image_index_p.value = image_index
    #   @swapchain_p.value = swapchain.to_ptr
    #   @present_info.waitSemaphoreCount = @submit_info.signalSemaphoreCount
    #   @present_info.pWaitSemaphores = @submit_info.pSignalSemaphores
    #   @present_info.swapchainCount = 1
    #   @present_info.pSwapchains = @swapchain_p
    #   @present_info.pImageIndices = @image_index_p
    #   @present_info.pResults = nil
    #   check_result @vk.vkQueuePresentKHR(queue.to_ptr, @present_info)
    # end

    def to_ptr
      @handle
    end
  end
end
