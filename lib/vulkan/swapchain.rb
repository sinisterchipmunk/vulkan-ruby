module Vulkan
  class Swapchain
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    attr_reader :extent
    attr_reader :color_space
    attr_reader :format
    attr_reader :image_views

    def initialize(instance, device, surface:,
                                     surface_width:,
                                     surface_height:,
                                     app_config: {},
                                     builder_class: Vulkan::SwapchainBuilder,
                                     image_usage: VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT,
                                     image_array_layers: 1,
                                     sharing_mode: VK_SHARING_MODE_EXCLUSIVE,
                                     composite_alpha: VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
                                     clipped: true,
                                     old_swapchain: nil)
      @vk = Vulkan[instance, device]

      info = device.physical_device.swapchain_surface_info(surface)
      builder = builder_class.new(info, app_config)
      @extent = { width: builder.width(surface_width), height: builder.height(surface_height) }

      image_format = builder.format
      @format = image_format[:format]
      @color_space = image_format[:color_space]

      create_info = VkSwapchainCreateInfoKHR.malloc
      create_info.sType                 = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR
      create_info.surface               = surface.to_ptr
      create_info.minImageCount         = builder.image_count
      create_info.imageFormat           = @format
      create_info.imageColorSpace       = @color_space
      create_info.imageExtent.width     = @extent[:width]
      create_info.imageExtent.height    = @extent[:height]
      create_info.imageArrayLayers      = image_array_layers
      create_info.imageUsage            = image_usage
      create_info.imageSharingMode      = sharing_mode
      create_info.queueFamilyIndexCount = 0
      create_info.pQueueFamilyIndices   = nil
      create_info.preTransform          = syms_to_surface_transforms(builder.transformation)
      create_info.compositeAlpha        = composite_alpha
      create_info.presentMode           = sym_to_present_mode(builder.presentation_mode)
      create_info.clipped               = clipped ? VK_TRUE : VK_FALSE
      create_info.oldSwapchain          = old_swapchain

      swapchain = Vulkan.create_value("void *", nil)
      check_result @vk.vkCreateSwapchainKHR(device.to_ptr, create_info, nil, swapchain)
      @handle = swapchain.value
      finalize_with @vk, :vkDestroySwapchainKHR, device.to_ptr, @handle, nil

      image_count_p = Vulkan.create_value('uint32_t', 0)
      check_result @vk.vkGetSwapchainImagesKHR(device.to_ptr, @handle, image_count_p, nil)
      images_p = Vulkan.struct("images[#{image_count_p.value}]" => 'void *handle').malloc
      check_result @vk.vkGetSwapchainImagesKHR(device.to_ptr, @handle, image_count_p, images_p);
      @image_views = images_p.images.map { |i| ImageView.new(@vk, i.handle, sym_to_image_format(@format)) }

      @image_index_p = Vulkan.create_value('uint32_t', 0)
    end

    def [](method_name)
      send method_name
    end

    def width
      @extent[:width]
    end

    def height
      @extent[:height]
    end

    def size
      image_views.size
    end

    def next_image_index(semaphore: nil, fence: nil, timeout: 0xffffffffffffffff)
      @vk.vkAcquireNextImageKHR(@vk.device, to_ptr, timeout, semaphore, fence, @image_index_p)
      @image_index_p.value
    end
  end
end
