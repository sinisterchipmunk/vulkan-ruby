module Vulkan
  class Memory
    include Vulkan::Checks
    include Vulkan::Finalizer

    attr_reader :requirements
    attr_reader :physical_device

    def initialize(vk, physical_device,
                       owner:,
                       properties: VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT |
                                   VK_MEMORY_PROPERTY_HOST_COHERENT_BIT)
      @vk = vk
      @physical_device = physical_device
      @properties = properties
      @owner = owner
      @mapped = Vulkan.create_value('void *', nil)

      @requirements = query_memory_requirements

      alloc_info = VkMemoryAllocateInfo.malloc
      alloc_info.sType           = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO
      alloc_info.allocationSize  = @requirements.size
      alloc_info.memoryTypeIndex = memory_type_index
      memory_handle_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkAllocateMemory(@vk.device, alloc_info, nil, memory_handle_p)
      @handle = memory_handle_p.value
      finalize_with @vk, :vkFreeMemory, @vk.device, @handle, nil
      bind
    end

    def memory_type_index
      physical_device.memory_properties[:memory_type_count].times do |i|
        if (requirements.memoryTypeBits & (1 << i)) != 0 &&
           (physical_device.memory_properties[:memory_types][i][:property_flags] & @properties) == @properties
          return i
        end
      end

      raise 'failed to find suitable memory type'
    end

    def data
      raise 'no data pointer: buffer is not mapped' unless mapped?
      @mapped
    end

    def mapped?
      @mapped && @mapped.value.to_i != 0
    end

    def unmap
      raise 'buffer is not mapped' unless mapped?
      @mapped.value = nil
      @vk.vkUnmapMemory(@vk.device, @handle)
    end

    def map(offset = 0, size: VK_WHOLE_SIZE, &block)
      raise 'buffer is already mapped' if mapped?
      @vk.vkMapMemory(@vk.device, @handle, offset, size, 0, @mapped)

      if block_given?
        begin
          yield @mapped.value
        ensure
          unmap
        end
      end
    end
  end
end
