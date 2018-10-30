module Vulkan
  class Semaphore
    include Vulkan::Checks
    include Vulkan::Finalizer

    def initialize(vk)
      @vk = vk
      semaphore_info = VkSemaphoreCreateInfo.malloc
      semaphore_info.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO
      sem_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateSemaphore(@vk.device, semaphore_info, nil, sem_p)
      @handle = sem_p.value
      finalize_with @vk, :vkDestroySemaphore, @vk.device, @handle, nil
    end
  end
end
