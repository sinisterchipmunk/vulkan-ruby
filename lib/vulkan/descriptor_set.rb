module Vulkan
  class DescriptorSet
    include Vulkan::Finalizer

    def initialize(vk, pool, handle, freeable)
      @vk = vk
      @handle = handle
      if freeable
        handle_p = Vulkan.create_value('void *', handle)
        finalize_with vk, :vkFreeDescriptorSets, vk.device, pool, 1, handle_p
      end
    end

    def update_descriptor_sets(buffer_infos: nil,
                               image_infos: nil,
                               texel_buffer_views: nil,
                               binding:,
                               array_element: 0,
                               type:,
                               count:)
      @wd ||= VkWriteDescriptorSet.malloc
      @wd.sType            = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET
      @wd.dstSet           = to_ptr
      @wd.dstBinding       = binding
      @wd.dstArrayElement  = array_element
      @wd.descriptorType   = type
      @wd.descriptorCount  = count
      @wd.pBufferInfo      = buffer_infos
      @wd.pImageInfo       = image_infos
      @wd.pTexelBufferView = texel_buffer_views
      @vk.vkUpdateDescriptorSets(@vk.device, 1, @wd, 0, nil)
    end

    def build_uniform_buffer_update(buffer:, offset: 0, range: buffer.size)
      VkDescriptorBufferInfo.malloc.tap do |info|
        info.buffer = buffer.to_ptr
        info.offset = offset
        info.range  = range
      end
    end

    def update_uniform_buffers(array, binding:, array_element: 0, **args)
      infos = array_of_structures(array.map { |args| build_uniform_buffer_update(**args) })
      update_descriptor_sets(buffer_infos: infos,
                             count: array.size,
                             type: VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
                             binding: binding,
                             array_element: array_element)
    end

    def update_uniform_buffer(buffer, binding:, array_element: 0, **args)
      info = build_uniform_buffer_update(buffer: buffer, **args)
      update_descriptor_sets(buffer_infos: info,
                             count: 1,
                             type: VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
                             binding: binding,
                             array_element: array_element)
    end

    def update_texel_view(*, **)
      raise NotImplemented
    end

    def update_image(image)
      raise NotImplemented
    end
  end
end
