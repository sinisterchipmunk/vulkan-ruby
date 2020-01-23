module Vulkan
  class SwapchainSurfaceInfo < Hash
    include Vulkan::Checks
    include Vulkan::Conversions

    attr_accessor :builder

    def initialize(instance, physical_device, surface)
      super()
      @vk = Vulkan[instance, nil]
      @physical_device = physical_device
      @surface = surface
      merge! capabilities:       capabilities,
             formats:            formats,
             presentation_modes: presentation_modes
    end

    def presentation_modes
      @presentation_modes ||= begin
        modes_count_p = Vulkan.create_value('uint32_t', 0)
        check_result @vk.vkGetPhysicalDeviceSurfacePresentModesKHR(@physical_device.to_ptr, @surface.to_ptr, modes_count_p, nil)
        modes_p = Vulkan.struct(["VkPresentModeKHR modes[#{modes_count_p.value}]"]).malloc
        check_result @vk.vkGetPhysicalDeviceSurfacePresentModesKHR(@physical_device.to_ptr, @surface.to_ptr, modes_count_p, modes_p)
        modes_p.modes.map { |mode| present_mode_to_sym(mode) }
      end
    end

    def formats
      @formats ||= begin
        format_count_p = Vulkan.create_value('uint32_t', 0)
        check_result @vk.vkGetPhysicalDeviceSurfaceFormatsKHR(@physical_device.to_ptr, @surface.to_ptr, format_count_p, nil)
        formats_p = Vulkan.struct("formats[#{format_count_p.value}]" => VkSurfaceFormatKHR).malloc
        check_result @vk.vkGetPhysicalDeviceSurfaceFormatsKHR(@physical_device.to_ptr, @surface.to_ptr, format_count_p, formats_p)
        formats_p.formats.map { |fmt| struct_to_hash(fmt) }
      end
    end

    def capabilities
      @capabilities ||= begin
        capabilities = VkSurfaceCapabilitiesKHR.malloc
        check_result @vk.vkGetPhysicalDeviceSurfaceCapabilitiesKHR(@physical_device.to_ptr, @surface.to_ptr, capabilities)
        capabilities = struct_to_hash(capabilities)
        capabilities[:supported_transforms_flags] = capabilities[:supported_transforms]
        capabilities[:supported_transforms] = flags_to_symbols(capabilities[:supported_transforms_flags], /^VK_SURFACE_TRANSFORM_(.*?)_BIT/)
        capabilities[:current_transform_flags] = capabilities[:current_transform]
        capabilities[:current_transform] = flags_to_symbols(capabilities[:current_transform_flags], /^VK_SURFACE_TRANSFORM_(.*?)_BIT/)
        capabilities[:supported_composite_alpha_flags] = capabilities[:supported_composite_alpha]
        capabilities[:supported_composite_alpha] = flags_to_symbols(capabilities[:supported_composite_alpha_flags], /^VK_COMPOSITE_ALPHA_(.*?)_BIT/)
        capabilities[:supported_usage] = flags_to_symbols(capabilities[:supported_usage_flags], /^VK_IMAGE_USAGE_(.*?)_BIT/)
        capabilities
      end
    end
  end
end
