module Vulkan
  class BufferMemory < Memory
    def initialize(vk, physical_device, owner:, **options)
      @owner = owner
      super(vk, physical_device, **options)
    end

    def query_memory_requirements
      VkMemoryRequirements.malloc.tap do |req|
        @vk.vkGetBufferMemoryRequirements(@vk.device, @owner.to_ptr, req)
      end
    end

    def bind
      @vk.vkBindBufferMemory(@vk.device, @owner.to_ptr, to_ptr, 0);
    end

    def create_barrier(**args)
      Vulkan::BufferMemoryBarrier.new(buffer: @owner, **args)
    end
  end
end
