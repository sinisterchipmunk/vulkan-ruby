module Vulkan
  class MemoryBarrier
    include Vulkan::Conversions

    def initialize(src_access:,
                   dst_access:)
      @struct = VkMemoryBarrier.malloc
      @struct.sType = VK_STRUCTURE_TYPE_MEMORY_BARRIER
      self.src_access = src_access
      self.dst_access = dst_access
    end

    def src_access; @src_access; end
    def src_access=(s); @src_access = s; @struct.srcAccessMask = syms_to_access_mask(s); end
    def dst_access; @dst_access; end
    def dst_access=(s); @dst_access = s; @struct.dstAccessMask = syms_to_access_mask(s); end

    def to_ptr
      @struct.to_ptr
    end
  end
end

