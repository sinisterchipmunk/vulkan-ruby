module Vulkan
  class ImageMemory < Memory
    def query_memory_requirements
      VkMemoryRequirements.malloc.tap do |req|
        @vk.vkGetImageMemoryRequirements(@vk.device, @owner.to_ptr, req)
      end
    end

    def bind
      @vk.vkBindImageMemory(@vk.device, @owner.to_ptr, to_ptr, 0);
    end
  end
end
