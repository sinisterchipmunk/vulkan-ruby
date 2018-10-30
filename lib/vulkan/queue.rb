module Vulkan
  class Queue
    include Vulkan::Checks
    include Vulkan::Conversions

    attr_reader :priority
    attr_reader :index

    def initialize(vk, handle, priority:, index:)
      @vk = vk
      @handle = handle
      @priority = priority
      @index = index

      # pointers used and reused during queue submit and presentment, to avoid
      # unnecessary GC
      @wait_semaphores_buffers = { 0 => nil }
      @wait_stages_buffers = { 0 => nil }
      @signal_semaphores_buffers = { 0 => nil }
      @command_buffers_buffers = { 0 => nil }
      @submit_infos = { 0 => nil, 1 => Vulkan.struct("infos[1]" => VkSubmitInfo).malloc }
      @submit_infos[1].infos[0].sType = VK_STRUCTURE_TYPE_SUBMIT_INFO
      @image_indices_buffers = { 0 => nil }
      @swapchains_buffers = { 0 => nil }
      @present_info = VkPresentInfoKHR.malloc
      @present_info.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR
    end

    def submit_infos(submit_infos, fence = nil)
      submit_infos_p = @submit_infos[submit_infos.size] ||= Vulkan.struct("infos[#{submit_infos.size}]" => VkSubmitInfo).malloc
      submit_infos.each_with_index do |info, i|
        next if submit_infos_p.infos[i] == info
        submit_infos_p.infos[i].memcpy(info)
      end

      check_result @vk.vkQueueSubmit(to_ptr, submit_infos.size, submit_infos_p, fence)
    end

    def submit(command_buffers, wait_semaphores: [], wait_stages: [], signal_semaphores: [], fence: nil)
      wait_stages_p = @wait_stages_buffers[wait_stages.size] ||= Vulkan.struct(["VkPipelineStageFlags stages[#{wait_stages.size}]"]).malloc
      wait_stages.each_with_index { |stage, index| wait_stages_p.stages[index] = stage }

      wait_semaphores_p = @wait_semaphores_buffers[wait_semaphores.size] ||= Fiddle::Pointer.malloc(wait_semaphores.size * Fiddle::SIZEOF_VOIDP)
      array_of_pointers(wait_semaphores, wait_semaphores_p)

      signal_semaphores_p = @signal_semaphores_buffers[signal_semaphores.size] ||= Fiddle::Pointer.malloc(signal_semaphores.size * Fiddle::SIZEOF_VOIDP)
      array_of_pointers(signal_semaphores, signal_semaphores_p)

      command_buffers_p = @command_buffers_buffers[command_buffers.size] ||= Fiddle::Pointer.malloc(command_buffers.size * Fiddle::SIZEOF_VOIDP)
      array_of_pointers(command_buffers, command_buffers_p)

      submit_info = @submit_infos[1].infos[0]
      submit_info.waitSemaphoreCount   = wait_semaphores.size
      submit_info.pWaitSemaphores      = wait_semaphores_p
      submit_info.pWaitDstStageMask    = wait_stages_p
      submit_info.commandBufferCount   = command_buffers.size
      submit_info.pCommandBuffers      = command_buffers_p
      submit_info.signalSemaphoreCount = signal_semaphores.size
      submit_info.pSignalSemaphores    = signal_semaphores_p

      submit_infos(@submit_infos[1].infos, fence)
    end

    def present(swapchains:, image_indices:, wait_semaphores: [])
      raise ArgumentError, "swapchains and image_indices must have same sizes" unless swapchains.size == image_indices.size

      wait_semaphores_p = @wait_semaphores_buffers[wait_semaphores.size] ||= Fiddle::Pointer.malloc(wait_semaphores.size * Fiddle::SIZEOF_VOIDP)
      array_of_pointers(wait_semaphores, wait_semaphores_p)

      image_indices_p = @image_indices_buffers[image_indices.size] ||= Vulkan.struct(["uint32_t indices[#{image_indices.size}]"]).malloc
      data = image_indices.pack("I*")
      image_indices_p[0, data.size] = data

      swapchains_p = @swapchains_buffers[swapchains.size] ||= Fiddle::Pointer.malloc(swapchains.size * Fiddle::SIZEOF_VOIDP)
      array_of_pointers(swapchains, swapchains_p)

      @present_info.waitSemaphoreCount = wait_semaphores.size
      @present_info.pWaitSemaphores = wait_semaphores_p
      @present_info.swapchainCount = swapchains.size
      @present_info.pSwapchains = swapchains_p
      @present_info.pImageIndices = image_indices_p
      @present_info.pResults = nil
      check_result @vk.vkQueuePresentKHR(to_ptr, @present_info)
    end

    def to_ptr
      @handle
    end
  end
end
