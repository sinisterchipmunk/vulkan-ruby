module Vulkan
  class SwapchainBuilder
    attr_reader :surface_info
    attr_reader :config

    def initialize(swapchain_surface_info, config = {})
      @surface_info = swapchain_surface_info
      @config = config
      raise 'swapchain not supported' unless usage_supported?
    end

    # Chooses and returns a swapchain image format from those supported.
    # An override may be specified in
    # `config[:graphics][:swapchain][:image][:format]` and/or
    # `config[:graphics][:swapchain][:image][:color_space]`. The
    # defaults are `:r8g8b8a8_unorm` and `:srgb_nonlinear`, respectively.
    def format
      supported = surface_info.formats

      # By default use the most widely supported R8 G8 B8 A8 format with
      # nonlinear colorspace.
      preferred_format = { format: :r8g8b8a8_unorm, color_space: :srgb_nonlinear }

      # If app config specifies an override, and it is supported, then
      # use it.
      if override = config.dig(:graphics, :swapchain, :image)
        preferred_format[:format] = override[:format] if override.key?(:format)
        preferred_format[:color_space] = override[:color_space] if override.key?(:color_space)
      end

      # If the list contains only one entry with an undefined format then
      # it means that there are no preferred surface formats and any can
      # be chosen.
      return preferred_format if supported.size == 1 && supported[0][:format] == :undefined

      # Check if the preferred format is supported, and use it if possible
      return preferred_format if supported.include?(preferred_format)

      # No match found, try to match the format ignoring colorspace
      supported.each { |sup| return sup if sup[:format] == preferred_format[:format] }

      # No match, return the first format in the list
      return supported.first || raise('no supported swapchain image formats')
    end

    def presentation_mode
      # :fifo should always be available;
      # :mailbox is the lowest latency V-Sync enabled mode (something like
      # triple-buffering) so use it if available
      supported = surface_info.presentation_modes
      preferred_mode = config.dig(:graphics, :swapchain, :vsync) == false ? :immediate :
                       config.dig(:graphics, :swapchain, :presentation_mode)&.to_sym
      if preferred_mode && supported.include?(preferred_mode)
        return preferred_mode
      else
        return :mailbox if supported.include?(:mailbox)
        return :fifo if supported.include?(:fifo)
        return :fifo_relaxed if supported.include?(:fifo_relaxed)
        return :immediate if supported.include?(:immediate)
        return raise('no supported presentation modes (available: %s)' % supported.inspect)
      end
    end

    def transformation
      return :identity if @surface_info.capabilities[:supported_transforms].include?(:identity)
      return @surface_info.capabilities[:current_transform]
    end

    def usage_supported?
      usage = @surface_info.capabilities[:supported_usage]
      usage.include?(:transfer_dst)
    end

    def width(desired_width)
      surface_capabilities = surface_info.capabilities
      desired_width  ||= surface_capabilities[:current_extent][:width]
      if desired_width  == -1
        desired_width  = (config.dig(:graphics, :swapchain, :width))  ||
                         (config.dig(:window, :width)) ||
                         640
      end
      desired_width.clamp(surface_capabilities[:min_image_extent][:width],
                          surface_capabilities[:max_image_extent][:width])
    end

    def height(desired_height)
      surface_capabilities = surface_info.capabilities
      desired_height  ||= surface_capabilities[:current_extent][:height]
      if desired_height  == -1
        desired_height  = (config.dig(:graphics, :swapchain, :height))  ||
                         (config.dig(:window, :height)) ||
                         640
      end
      desired_height.clamp(surface_capabilities[:min_image_extent][:height],
                           surface_capabilities[:max_image_extent][:height])
    end

    def dimensions(desired_width = nil, desired_height = nil)
      [width(desired_width), height(desired_height)]
    end

    def image_count
      count = @surface_info.capabilities[:min_image_count] + 1
      if @surface_info.capabilities[:max_image_count] > 0 &&
         count > @surface_info.capabilities[:max_image_count]
        count = @surface_info.capabilities[:max_image_count]
      end
      return count
    end
  end
end
