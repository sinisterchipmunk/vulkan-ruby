module Vulkan
  class DescriptorSet
    include Vulkan::Conversions
    include Vulkan::Finalizer

    class DescriptorWrite
      include Vulkan::Conversions

      def initialize(owner, layout)
        @changed = false
        @writer = VkWriteDescriptorSet.malloc
        @writer.sType            = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET
        @writer.dstSet           = owner.to_ptr
        @writer.dstBinding       = layout.binding
        @writer.dstArrayElement  = 0
        @writer.descriptorType   = layout.descriptorType
        @writer.descriptorCount  = layout.descriptorCount
        @writer.pBufferInfo      = nil
        @writer.pImageInfo       = nil
        @writer.pTexelBufferView = nil
      end

      def set_buffer(buffer, offset: 0, range: buffer.size, array_element: 0)
        @changed = true
        @info = VkDescriptorBufferInfo.malloc
        @info.buffer        = buffer.to_ptr
        @info.offset        = offset
        @info.range         = range
        @writer.pImageInfo  = @writer.pTexelBufferView = nil
        @writer.pBufferInfo = @info
        @writer.dstArrayElement = array_element
      end

      def set_image_view_and_sampler(image_view, sampler, layout: :shader_read_only_optimal, array_element: 0)
        @changed = true
        @info = VkDescriptorImageInfo.malloc
        @info.imageLayout   = sym_to_image_layout(layout)
        @info.imageView     = image_view.to_ptr
        @info.sampler       = sampler.to_ptr
        @writer.pBufferInfo = @writer.pTexelBufferView = nil
        @writer.pImageInfo  = @info
        @writer.dstArrayElement = array_element
      end

      def to_ptr
        @writer.to_ptr
      end

      def changed?
        @changed
      end
    end

    def initialize(vk, pool, layout, handle, freeable)
      @vk = vk
      @handle = handle
      if freeable
        handle_p = Vulkan.create_value('void *', handle)
        finalize_with vk, :vkFreeDescriptorSets, vk.device, pool, 1, handle_p
      end

      @descriptor_writes = layout.descriptors.each_with_index.map do |desc_layout, i|
        DescriptorWrite.new(self, desc_layout)
      end
    end

    def [](index)
      @descriptor_writes[index]
    end

    def commit
      writes = @descriptor_writes.select { |write| write.changed? }
      return unless writes.any?
      writes_p = array_of_structures(writes)
      @vk.vkUpdateDescriptorSets(@vk.device, writes.size, writes_p, 0, nil)
    end

    def update_texel_view(*, **)
      raise NotImplemented
    end

    def update_image(image)
      raise NotImplemented
    end
  end
end
