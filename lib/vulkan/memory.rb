module Vulkan
  class Memory
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    attr_reader :requirements
    attr_reader :physical_device

    def initialize(vk, physical_device,
                       owner:,
                       properties: [:host_visible])
      @range_array = nil
      @vk = vk
      @physical_device = physical_device
      @properties = syms_to_memory_properties(properties)
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

    def size
      @requirements.size
    end

    def memory_type_index
      properties = {}
      physical_device.memory_properties[:memory_type_count].times do |i|
        if (requirements.memoryTypeBits & (1 << i)) != 0
          if (physical_device.memory_properties[:memory_types][i][:property_flags] & @properties) == @properties
            return i
          else
            properties[i] = "0x%x" % physical_device.memory_properties[:memory_types][i][:property_flags]
          end
        end
      end

      raise 'failed to find suitable memory type (needed properties == 0x%x, memory type count == %d, requrement memory type bits == 0b%s, available properties == %s)' % [
        @properties,
        physical_device.memory_properties[:memory_type_count],
        requirements.memoryTypeBits.to_s(2),
        properties.inspect
      ]
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

    # Flushes a single range of memory, which defaults to the entire buffer.
    # Do this after modifying memory to inform the device that it may have
    # changed. This method is called automatically after the block form of
    # #map has completed, but is not called automatically if no block is
    # provided to #map.
    #
    # See https://www.khronos.org/registry/vulkan/specs/1.2-extensions/man/html/vkFlushMappedMemoryRanges.html
    def flush(offset: 0, size: offset > 0 ? self.size - offset : VK_WHOLE_SIZE)
      flush_all [{ offset: offset, size: size }]
    end

    # Flushes each of a set of memory ranges, given as
    # `[{:offset => number, :size => number}]`. No defaults are provided,
    # and ArgumentError will be raised if any fields are omitted.
    # Do this after modifying memory to inform the device that it may have
    # changed.
    #
    # See https://www.khronos.org/registry/vulkan/specs/1.2-extensions/man/html/vkFlushMappedMemoryRanges.html
    def flush_all(ranges)
      @vk.vkFlushMappedMemoryRanges(@vk.device, ranges.size, memory_ranges(ranges))
    end

    # Invalidates a single range of memory, which defaults to the entire
    # buffer. Do this prior to reading memory that may have been modified by
    # a device. This method is called automatically at the beginning of #map,
    # but is not called automatically at any other point, so if you leave
    # the memory mapped (for example, by not passing a block to #map), then
    # you need to call this method explicitly at the appropriate times.
    #
    # See https://www.khronos.org/registry/vulkan/specs/1.2-extensions/man/html/vkInvalidateMappedMemoryRanges.html
    def invalidate(offset: 0, size: offset > 0 ? self.size - offset : VK_WHOLE_SIZE)
      invalidate_all [{ offset: offset, size: size }]
    end

    # Invalidates each of a set of memory ranges, given as
    # `[{:offset => number, :size => number}]`. No defaults are provided,
    # and ArgumentError will be raised if any fields are omitted. Do this
    # prior to reading memory that may have been modified by a device.
    #
    # See https://www.khronos.org/registry/vulkan/specs/1.2-extensions/man/html/vkInvalidateMappedMemoryRanges.html
    def invalidate_all(ranges)
      @vk.vkInvalidateMappedMemoryRanges(@vk.device, ranges.size, memory_ranges(ranges))
    end

    # Provides a pointer to an array of memory ranges for e.g. flushing memory
    protected def memory_ranges(ranges)
      # avoid reallocating @range_array if possible
      unless @range_array&.ranges&.count.to_i >= ranges.count
        @range_array = Vulkan.struct("ranges[#{ranges.count}]" => VkMappedMemoryRange).malloc
        ranges.each_with_index do |rng, i|
          range = @range_array.ranges[i]
          range.sType = VK_STRUCTURE_TYPE_MAPPED_MEMORY_RANGE
          range.pNext = nil
          range.memory = @handle
        end
      end
      ranges.each_with_index do |rng, i|
        range = @range_array.ranges[i]
        range.offset = rng[:offset] || raise(ArgumentError, "memory range must specify :offset")
        range.size   = rng[:size]   || raise(ArgumentError, "memory range must specify :size")
      end
      @range_array
    end

    # Maps this memory range. If a block is provided, a pointer to the start
    # of the mapped memory range is yielded to the block and the memory is
    # automatically unmapped after the block finishes and `nil` is returned
    # to prevent writing to a no-longer-mapped address.
    #
    # If no block is provided, the memory remains mapped and the pointer is
    # returned.
    #
    # If `invalidate` is true, the range to be mapped will be invalidated
    # automatically before mapping to ensure that the memory will be up to
    # date with any changes from the device. If false, the memory may be out
    # of date when you map it.
    #
    # If `flush` is true, and a block is given, then the memory will be
    # flushed to ensure that it is updated on the device after your block
    # completes. If no block is given, this option has no effect.
    def map(offset: 0, size: offset > 0 ? self.size - offset : VK_WHOLE_SIZE,
            invalidate: true, flush: true, &block)
      raise 'buffer is already mapped' if mapped?
      self.invalidate offset: offset, size: size if invalidate
      @vk.vkMapMemory(@vk.device, @handle, offset, size, 0, @mapped)
      size = self.size if size == VK_WHOLE_SIZE
      if block_given?
        begin
          yield Fiddle::Pointer.new(@mapped.value.to_i, size)
        ensure
          self.flush offset: offset, size: size if flush
          unmap
        end
        return nil
      else
        return Fiddle::Pointer.new(@mapped.value.to_i, size)
      end
    end
  end
end
