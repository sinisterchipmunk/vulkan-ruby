module Vulkan
  class Buffer
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    attr_reader :memory
    attr_reader :size
    attr_reader :usage

    def initialize(vk, physical_device, size:,
                                        usage:,
                                        sharing_mode: VK_SHARING_MODE_EXCLUSIVE,
                                        flags: 0,
                                        **memory_args)
      @vk = vk
      @size = size
      @mapped = Vulkan.create_value('void *', nil)

      buffer_info = VkBufferCreateInfo.malloc
      buffer_info.sType       = VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
      buffer_info.size        = size
      buffer_info.usage       = syms_to_buffer_usage_flags(usage)
      buffer_info.sharingMode = sharing_mode
      buffer_info.flags       = flags
      handle_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateBuffer(vk.device, buffer_info, nil, handle_p)
      @handle = handle_p.value
      @memory = Vulkan::BufferMemory.new(@vk, physical_device, owner: self,
                                                             **memory_args)
      finalize_with @vk, :vkDestroyBuffer, vk.device, @handle, nil
    end

    def create_barrier(**args)
      @memory.create_barrier(**args)
    end

    def map(*args, &block)
      memory.map(*args, &block)
    end

    def flush(...)
      memory.flush(...)
    end

    def flush_all(...)
      memory.flush_all(...)
    end

    def invalidate(...)
      memory.invalidate(...)
    end

    def invalidate_all(...)
      memory.invalidate_all(...)
    end

    def mapped?
      memory.mapped?
    end

    def unmap
      memory.unmap
    end

    def data
      memory.data
    end
  end
end
