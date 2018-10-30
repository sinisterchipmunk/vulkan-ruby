module Vulkan
  class SwapchainBuilder
    attr_reader :info

    def initialize(swapchain_surface_info)
      @info = swapchain_surface_info
    end

    def capabilities
      info[:capabilities]
    end

    def presentation_modes
      info[:presentation_modes]
    end

    def formats
      info[:formats]
    end

    def image_count
      if capabilities[:max_image_count] > 0
        [capabilities[:min_image_count] + 1, capabilities[:max_image_count]].min
      else
        capabilities[:min_image_count] + 1
      end
    end

    def choose_extent(window_width, window_height)
      return capabilities[:current_extent] if capabilities[:current_extent][:width] != 0xffffffff
      extent = {}
      extent[:width] = [
                         capabilities[:min_image_extent][:width],
                         [
                           capabilities[:max_image_extent][:width],
                           window_width
                         ].min
                       ].max
      extent[:height] = [
                          capabilities[:min_image_extent][:height],
                          [
                            capabilities[:max_image_extent][:height],
                            window_height
                          ].min
                        ].max
      extent
    end

    def optimal_format
      if formats.size == 1 && formats[0][:format] == :undefined
        # no preferred format
        return { format: :b8g8r8a8_unorm, color_space: :srgb_nonlinear_khr }
      end

      formats.each do |format|
        if format[:format] == :b8g8r8a8_unorm && format[:color_space] == :srgb_nonlinear_khr
          return format
        end
      end

      # ideal format is not present, just take the first one offered
      return formats[0]
    end

    def optimal_presentation_mode
      presentation_modes.each { |mode| return mode if mode == VK_PRESENT_MODE_MAILBOX_KHR   }
      presentation_modes.each { |mode| return mode if mode == VK_PRESENT_MODE_IMMEDIATE_KHR }
      VK_PRESENT_MODE_FIFO_KHR
    end
  end
end
