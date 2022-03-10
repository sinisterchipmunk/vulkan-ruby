module Vulkan
  class ImageView
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    attr_reader :image

    def initialize(vk, image, image_format,
                   view_type: VK_IMAGE_VIEW_TYPE_2D,
                   red_swizzle: VK_COMPONENT_SWIZZLE_IDENTITY,
                   green_swizzle: VK_COMPONENT_SWIZZLE_IDENTITY,
                   blue_swizzle: VK_COMPONENT_SWIZZLE_IDENTITY,
                   alpha_swizzle: VK_COMPONENT_SWIZZLE_IDENTITY,
                   aspects: :color,
                   base_mip_level: 0,
                   level_count: 1,
                   base_array_layer: 0,
                   layer_count: 1)
      @vk = vk
      @image = image
      create_info = VkImageViewCreateInfo.malloc
      create_info.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO
      create_info.image = image.respond_to?(:to_ptr) ? image.to_ptr : image
      create_info.viewType = view_type
      create_info.format = sym_to_image_format(image_format)
      create_info.components.r = red_swizzle
      create_info.components.g = green_swizzle
      create_info.components.b = blue_swizzle
      create_info.components.a = alpha_swizzle
      create_info.subresourceRange.aspectMask = syms_to_image_aspect_flags(aspects)
      create_info.subresourceRange.baseMipLevel = base_mip_level
      create_info.subresourceRange.levelCount = level_count
      create_info.subresourceRange.baseArrayLayer = base_array_layer
      create_info.subresourceRange.layerCount = layer_count
      view_p = Vulkan.create_value("void *", nil)
      check_result @vk.vkCreateImageView(vk.device, create_info, nil, view_p)
      @handle = view_p.value
      finalize_with @vk, :vkDestroyImageView, vk.device, @handle, nil
    end

    def to_ptr
      @handle
    end
  end
end
