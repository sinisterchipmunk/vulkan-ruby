module Vulkan
  class BufferMemory < Memory
    def query_memory_requirements
      VkMemoryRequirements.malloc.tap do |req|
        @vk.vkGetBufferMemoryRequirements(@vk.device, @owner.to_ptr, req)
      end
    end

    def bind
      @vk.vkBindBufferMemory(@vk.device, @owner.to_ptr, to_ptr, 0);
    end
  end
end
