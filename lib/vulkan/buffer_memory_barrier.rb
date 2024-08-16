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
      self.src_access = src_access
      self.dst_access = dst_access
      self.src_queue_family_index = src_queue_family_index
      self.dst_queue_family_index = dst_queue_family_index
      self.buffer = buffer
      self.offset = offset
      self.size = size
    end

    def src_access; @src_access; end
    def src_access=(s); @src_access = s; @struct.srcAccessMask = syms_to_access_mask(s); end
    def dst_access; @dst_access; end
    def dst_access=(s); @dst_access = s; @struct.dstAccessMask = syms_to_access_mask(s); end
    def src_queue_family_index; @struct.srcQueueFamilyIndex; end
    def src_queue_family_index=(s); @struct.srcQueueFamilyIndex = s; end
    def dst_queue_family_index; @struct.dstQueueFamilyIndex; end
    def dst_queue_family_index=(s); @struct.dstQueueFamilyIndex = s; end
    def buffer; @buffer; end
    def buffer=(b); @buffer = b; @struct.buffer = b.to_ptr; end
    def offset; @struct.offset; end
    def offset=(o); @struct.offset = o; end
    def size; @struct.size; end
    def size=(s); @struct.size = s; end

    def to_ptr
      @struct.to_ptr
    end
  end
end

