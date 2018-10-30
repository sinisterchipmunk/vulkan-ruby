module Vulkan
  class CommandPool
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    def initialize(vk, queue_family:, transient: false, allow_reset: false)
      @vk = vk
      pool_info = VkCommandPoolCreateInfo.malloc
      pool_info.sType = VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO
      pool_info.queueFamilyIndex = queue_family_to_index(queue_family)
      pool_info.flags = (transient   ? VK_COMMAND_POOL_CREATE_TRANSIENT_BIT            : 0) |
                        (allow_reset ? VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT : 0)
      command_pool_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateCommandPool(vk.device, pool_info, nil, command_pool_p)
      @handle = command_pool_p.value
      finalize_with vk, :vkDestroyCommandPool, vk.device, @handle, nil
    end

    def create_command_buffer(**args, &block)
      create_command_buffers(1, **args, &block)[0]
    end

    def create_command_buffers(count, **args, &block)
      Vulkan::CommandBuffer.create(@vk, self, count: count, **args, &block)
    end
  end
end
