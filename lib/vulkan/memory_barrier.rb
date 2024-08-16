module Vulkan
  class MemoryBarrier
    include Vulkan::Conversions

    def initialize(src_access:,
                   dst_access:)
      @struct = VkMemoryBarrier.malloc
      @struct.sType = VK_STRUCTURE_TYPE_MEMORY_BARRIER
      @struct.srcAccessMask = syms_to_access_mask(src_access)
      @struct.dstAccessMask = syms_to_access_mask(dst_access)
      # @struct.srcStagesMask = syms_to_pipeline_stage_flags(src_stages)
      # @struct.dstStagesMask = syms_to_pipeline_stage_flags(dst_stages)
    end

    def to_ptr
      @struct.to_ptr
    end
  end
end

