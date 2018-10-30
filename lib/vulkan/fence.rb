module Vulkan
  class Fence
    include Vulkan::Checks
    include Vulkan::Finalizer

    def initialize(vk, signaled: false)
      @vk = vk
      fence_info = VkFenceCreateInfo.malloc
      fence_info.sType = VK_STRUCTURE_TYPE_FENCE_CREATE_INFO
      fence_info.flags = (signaled ? VK_FENCE_CREATE_SIGNALED_BIT : 0)
      fence_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateFence(@vk.device, fence_info, nil, fence_p)
      @handle = fence_p.value
      finalize_with @vk, :vkDestroyFence, @vk.device, @handle, nil
      @self_p = Vulkan.create_value('void *', nil)
      @self_p.value = @handle
    end

    def wait
      @vk.vkWaitForFences(@vk.device, 1, @self_p, VK_TRUE, 0xffffffffffffffff)
    end

    def reset
      @vk.vkResetFences(@vk.device, 1, @self_p)
    end

    def wait_and_reset
      wait
      reset
    end
  end
end
