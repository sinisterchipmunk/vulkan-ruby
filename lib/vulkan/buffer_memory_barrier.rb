module Vulkan
  class BufferMemoryBarrier
    include Vulkan::Conversions

    def initialize(src_access:,
                   dst_access:,
                   src_queue_family_index: VK_QUEUE_FAMILY_IGNORED,
                   dst_queue_family_index: VK_QUEUE_FAMILY_IGNORED,
                   buffer:,
                   offset: 0,
                   size: VK_WHOLE_SIZE)
      @struct = VkBufferMemoryBarrier.malloc
      @struct.sType = VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER
      @struct.srcAccessMask = syms_to_access_mask(src_access)
      @struct.dstAccessMask = syms_to_access_mask(dst_access)
      @struct.srcQueueFamilyIndex = src_queue_family_index
      @struct.dstQueueFamilyIndex = dst_queue_family_index
      @struct.buffer = buffer.to_ptr
      @struct.offset = offset
      @struct.size = size
    end

    def to_ptr
      @struct.to_ptr
    end
  end
end

