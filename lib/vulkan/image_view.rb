module Vulkan
  class ImageView
    include Vulkan::Checks
    include Vulkan::Finalizer

    def initialize(vk, image_handle, image_format,
                   view_type: VK_IMAGE_VIEW_TYPE_2D,
                   red_swizzle: VK_COMPONENT_SWIZZLE_IDENTITY,
                   green_swizzle: VK_COMPONENT_SWIZZLE_IDENTITY,
                   blue_swizzle: VK_COMPONENT_SWIZZLE_IDENTITY,
                   alpha_swizzle: VK_COMPONENT_SWIZZLE_IDENTITY,
                   aspect_mask: VK_IMAGE_ASPECT_COLOR_BIT,
                   base_mip_level: 0,
                   level_count: 1,
                   base_array_layer: 0,
                   layer_count: 1)
      @vk = vk
      create_info = VkImageViewCreateInfo.malloc
      create_info.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO
      create_info.image = image_handle
      create_info.viewType = view_type
      create_info.format = image_format
      create_info.components.r = red_swizzle
      create_info.components.g = green_swizzle
      create_info.components.b = blue_swizzle
      create_info.components.a = alpha_swizzle
      create_info.subresourceRange.aspectMask = aspect_mask
      create_info.subresourceRange.baseMipLevel = 0
      create_info.subresourceRange.levelCount = 1
      create_info.subresourceRange.baseArrayLayer = 0
      create_info.subresourceRange.layerCount = 1
      view_p = Vulkan.create_value("void *", nil)
      check_result @vk.vkCreateImageView(vk.device, create_info, nil, view_p)
      @handle = view_p.value
      finalize_with @vk, :vkDestroyImageView, vk.device, @handle, nil
    end

    def create_framebuffer(**args)
      Vulkan::Framebuffer.new(@vk, attachments: [self], **args)
    end

    def to_ptr
      @handle
    end
  end
end
