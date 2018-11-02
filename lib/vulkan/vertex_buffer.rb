module Vulkan
  class VertexBuffer
    include Vulkan::Checks
    include Vulkan::Finalizer

    attr_reader :size
    attr_reader :memory_requirements
    attr_reader :physical_device

    def initialize(vk, physical_device, size:,
                                        usage:,
                                        sharing_mode: VK_SHARING_MODE_EXCLUSIVE,
                                        flags: 0,
                                        properties: VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT |
                                                    VK_MEMORY_PROPERTY_HOST_COHERENT_BIT)
      @vk = vk
      @size = size
      @physical_device = physical_device
      @mapped = Vulkan.create_value('void *', nil)
      @properties = properties
      buffer_info = VkBufferCreateInfo.malloc
      buffer_info.sType       = VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
      buffer_info.size        = @size
      buffer_info.usage       = usage
      buffer_info.sharingMode = sharing_mode
      buffer_info.flags       = flags
      handle_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateBuffer(vk.device, buffer_info, nil, handle_p)
      @handle = handle_p.value
      allocate_memory
      finalize_with @vk, :vkDestroyBuffer, vk.device, @handle, nil
    end

    def data
      raise 'no data pointer: buffer is not mapped' unless mapped?
      @mapped
    end

    def memory_type_index
      physical_device.memory_properties[:memory_type_count].times do |i|
        if (memory_requirements.memoryTypeBits & (1 << i)) != 0 &&
           (physical_device.memory_properties[:memory_types][i][:property_flags] & @properties) == @properties
          return i
        end
      end

      raise 'failed to find suitable memory type'
    end

    def mapped?
      @mapped.value.to_i != 0
    end

    def unmap
      raise 'buffer is not mapped' unless mapped?
      @mapped.value = nil
      @vk.vkUnmapMemory(@vk.device, @memory_handle)
    end

    def map(offset = 0, &block)
      raise 'buffer is already mapped' if mapped?
      @vk.vkMapMemory(@vk.device, @memory_handle, offset, @size, 0, @mapped)

      if block_given?
        begin
          yield @mapped.value
        ensure
          unmap
        end
      end
    end

    def allocate_memory
      @memory_requirements = VkMemoryRequirements.malloc
      @vk.vkGetBufferMemoryRequirements(@vk.device, @handle, @memory_requirements)

      alloc_info = VkMemoryAllocateInfo.malloc
      alloc_info.sType           = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO
      alloc_info.allocationSize  = @memory_requirements.size
      alloc_info.memoryTypeIndex = memory_type_index
      memory_handle_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkAllocateMemory(@vk.device, alloc_info, nil, memory_handle_p)
      @memory_handle = memory_handle_p.value
      finalize_with @vk, :vkFreeMemory, @vk.device, @memory_handle, nil

      @vk.vkBindBufferMemory(@vk.device, @handle, @memory_handle, 0);
    end
  end
end
