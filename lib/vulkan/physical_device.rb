module Vulkan
  class PhysicalDevice
    include Vulkan::Checks
    include Vulkan::Conversions

    def initialize(instance, handle)
      @handle = handle
      @instance = instance
      @vk = Vulkan[instance, nil]
    end

    def inspect
      # force lazy instance variables to be initialized
      to_hash
      super
    end

    def to_ptr
      @handle
    end

    def to_hash
      {
        extensions: extensions,
        properties: properties,
        features: features_hash,
        queue_families: queue_families
      }
    end

    # Returns the swapchain surface info if the `"VK_KHR_swapchain"` extension
    # is supported, `nil` otherwise.
    def swapchain_surface_info(surface)
      if extension_names.include?('VK_KHR_swapchain')
        SwapchainSurfaceInfo.new(@instance, self, surface)
      else
        nil
      end
    end

    def extension_names
      extensions.map { |ext| ext[:extension_name] }
    end

    def create_logical_device(**args)
      Vulkan::LogicalDevice.new(@instance, self, **args)
    end

    alias create create_logical_device

    def queue_families
      @queue_families ||= begin
        count_ptr = Vulkan.create_value("uint32_t", 0)
        @vk.vkGetPhysicalDeviceQueueFamilyProperties(@handle, count_ptr, nil)

        container_struct = Vulkan.struct("queues[#{count_ptr.value}]" => VkQueueFamilyProperties)
        container = container_struct.malloc
        @vk.vkGetPhysicalDeviceQueueFamilyProperties(@handle, count_ptr, container)
        container.queues.each_with_index.map do |prop, index|
          info = struct_to_hash(prop, Vulkan::QueueFamily.new(@vk.instance, self, index))
          info[:supports] = flags_to_symbols(info[:queue_flags], /^VK_QUEUE_(.*?)_BIT$/)
          info[:index] = index
          info[:queues] = [1.0]
          info
        end
      end
    end

    def features_hash
      struct_to_hash features
    end

    def features
      @features ||= begin
        features = VkPhysicalDeviceFeatures.malloc
        @vk.vkGetPhysicalDeviceFeatures(@handle, features)
        features
      end
    end

    def properties
      @properties ||= begin
        properties = VkPhysicalDeviceProperties.malloc
        @vk.vkGetPhysicalDeviceProperties(@handle, properties)
        properties = struct_to_hash(properties)
        properties[:device_type] = const_to_symbol(properties[:device_type], /^VK_PHYSICAL_DEVICE_TYPE_(.*?)$/)
        properties
      end
    end

    def extensions
      @extensions ||= begin
        # get properties count
        count_ptr = Vulkan.create_value("uint32_t", 0)
        check_result @vk.vkEnumerateDeviceExtensionProperties(@handle, nil, count_ptr, nil)
        count = count_ptr.value
        # allocate n devices
        container_struct = Vulkan.struct("handles[#{count}]" => VkExtensionProperties)
        container = container_struct.malloc
        check_result @vk.vkEnumerateDeviceExtensionProperties(@handle, nil, count_ptr, container)
        container.handles.map { |handle| struct_to_hash(handle) }
      end
    end
  end
end
