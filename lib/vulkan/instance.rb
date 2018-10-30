module Vulkan
  class Instance
    extend  Vulkan::Checks
    extend  Vulkan::Conversions
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    class << self
      def extensions
        @extensions ||= begin
          property_count_ptr = Vulkan.create_value("uint32_t", 0)
          check_result Vulkan[nil, nil].vkEnumerateInstanceExtensionProperties(nil, property_count_ptr, nil)
          property_count = property_count_ptr.value
          container = Vulkan.struct("properties[#{property_count}]" => VkExtensionProperties).malloc
          check_result Vulkan[nil, nil].vkEnumerateInstanceExtensionProperties(nil, property_count_ptr, container)
          container.properties.map { |prop| struct_to_hash(prop) }
        end
      end

      def layers
        @layers ||= begin
          property_count_ptr = Vulkan.create_value("uint32_t", 0)
          check_result Vulkan[nil, nil].vkEnumerateInstanceLayerProperties(property_count_ptr, nil)
          property_count = property_count_ptr.value
          container_struct = Vulkan.struct("properties[#{property_count}]" => VkLayerProperties)
          container = container_struct.malloc
          check_result Vulkan[nil, nil].vkEnumerateInstanceLayerProperties(property_count_ptr, container)
          container.properties.map { |prop| struct_to_hash(prop) }
        end
      end
    end

    def initialize(application_name: $0,         application_version: '1.0.0',
                   engine_name: 'vulkan-ruby',   engine_version: Vulkan::VERSION,
                   api_version: Vulkan::VERSION, extensions: ,
                   layers: ENV['DEBUG'] ? [] : self.class.layers)
      extensions_p = Vulkan.struct("names[#{extensions.size}]" => ['char *name']).malloc
      extensions.each_with_index do |ext, i|
        extname = ext.kind_of?(String) ? ext : ext[:extension_name]
        extensions_p.names[i].name = Fiddle::Pointer[extname.b + "\x00"]
      end

      layers_p = Vulkan.struct("names[#{layers.size}]" => ['char *name']).malloc
      layers.each_with_index do |layer, i|
        layer_name = layer.kind_of?(String) ? layer : layer[:layer_name]
        layers_p.names[i].name = Fiddle::Pointer[layer_name.b + "\x00"]
      end

      application_info = VkApplicationInfo.malloc
      application_info.sType               = VK_STRUCTURE_TYPE_APPLICATION_INFO
      application_info.pNext               = nil
      application_info.pApplicationName    = application_name
      application_info.applicationVersion  = vk_make_version(application_version)
      application_info.pEngineName         = 'vulkan-ruby'
      application_info.engineVersion       = vk_make_version(engine_version)
      application_info.apiVersion          = vk_make_version(api_version)

      instance_info = VkInstanceCreateInfo.malloc
      instance_info.sType                   = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
      instance_info.pNext                   = nil
      instance_info.flags                   = 0
      instance_info.pApplicationInfo        = application_info
      instance_info.enabledLayerCount       = layers.size
      instance_info.ppEnabledLayerNames     = layers_p
      instance_info.enabledExtensionCount   = extensions.size
      instance_info.ppEnabledExtensionNames = extensions_p

      instance_wrapper = Vulkan.create_value("void *", nil)
      check_result Vulkan[nil, nil].vkCreateInstance(instance_info, nil, instance_wrapper)
      @handle = instance_wrapper.value
      @vk = Vulkan[self, nil]
      finalize_with @vk, :vkDestroyInstance, @handle, nil
    end

    def create_window_surface(window)
      WindowSurface.new(self, window)
    end

    # Returns an array of physical device handles. Use these to query the
    # capabilities of each physical device, and to create logical devices
    # based on the results.
    def physical_device_handles
      @physical_device_handles ||= begin
        # get device count
        device_count_ptr = Vulkan.create_value("uint32_t", 0)
        # check_result func.call(@handle, device_count_ptr, nil)
        check_result @vk.vkEnumeratePhysicalDevices(@handle, device_count_ptr, nil)
        device_count = device_count_ptr.value
        # allocate n devices
        container_struct = Vulkan.struct("handles[#{device_count}]" => ['VkPhysicalDevice handle'])
        container = container_struct.malloc
        # check_result func.call(@handle, device_count_ptr, container)
        check_result @vk.vkEnumeratePhysicalDevices(@handle, device_count_ptr, container)
        container.handles
      end
    end

    def physical_devices
      @physical_devices ||= physical_device_handles.map { |dev| PhysicalDevice.new(self, dev.handle) }
    end
  end
end
