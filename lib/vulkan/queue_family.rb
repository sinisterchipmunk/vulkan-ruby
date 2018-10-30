module Vulkan
  class QueueFamily < Hash
    include Vulkan::Checks
    
    attr_reader :physical_device

    def initialize(instance, physical_device, family_index)
      super()
      @physical_device = physical_device
      @vk = Vulkan[instance, nil]
      @family_index = family_index
    end

    def supports?(feature)
      self[:supports].include?(feature)
    end

    def supports_presentation?(surface)
      supported_p = Vulkan.create_value('VkBool32', 0)
      check_result @vk.vkGetPhysicalDeviceSurfaceSupportKHR(@physical_device.to_ptr,
                                                                   @family_index,
                                                                   surface.to_ptr,
                                                                   supported_p)
      return supported_p.value == 1
    end
  end
end
