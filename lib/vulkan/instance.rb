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

      def extension_names
        extensions.map { |ext| ext[:extension_name] }
      end

      def layer_names
        layers.map { |layer| layer[:layer_name] }
      end

      def version
        ver_p = Vulkan.create_value('uint32_t', 0)
        check_result Vulkan[nil, nil].vkEnumerateInstanceVersion(ver_p)
        vk_parse_version ver_p.value
      end
    end

    def initialize(application_name: $0,            application_version: '1.0.0',
                   engine_name: 'vulkan-ruby',      engine_version: Vulkan::VERSION,
                   api_version: self.class.version, extensions: ,
                   layers: [])
      layers.concat     ENV['LAYERS'].split(/\:\s/)              if ENV['LAYERS']
      extensions.concat ENV['INSTANCE_EXTENSIONS'].split(/\:\s/) if ENV['INSTANCE_EXTENSIONS']

      if ENV['DEBUG']
        extension_names = self.class.extension_names
        %w(
          VK_EXT_debug_utils
        ).each { |ext_name| extensions << ext_name if extension_names.include?(ext_name) }

        layer_names = self.class.layer_names
        %w(
          VK_LAYER_LUNARG_standard_validation
          VK_LAYER_LUNARG_parameter_validation
          VK_LAYER_LUNARG_assistant_layer
          VK_LAYER_LUNARG_api_dump
          VK_LAYER_GOOGLE_unique_objects
          VK_LAYER_LUNARG_demo_layer
          VK_LAYER_GOOGLE_threading
          VK_LAYER_LUNARG_monitor
          VK_LAYER_LUNARG_starter_layer
          VK_LAYER_LUNARG_core_validation
          VK_LAYER_LUNARG_object_tracker
        ).each do |layer_name|
          layers << layer_name if layer_names.include?(layer_name)
        end
      end

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
      hook_debug_utils_callback if extensions.include?('VK_EXT_debug_utils')
      finalize_with @vk, :vkDestroyInstance, @handle, nil
    end

    def hook_debug_utils_callback
      _, return_type, param_types = Vulkan.parse_signature('VkBool32 debug_callback(int   messageSeverity,' +
                                                                                   'int   messageType,' +
                                                                                   'void *pCallbackData,' +
                                                                                   'void *pUserData)')
      @debug_util_callback = Fiddle::Closure::BlockCaller.new(return_type, param_types) do |msg_severity, msg_type, cb_data_addr, user_arg_addr|
        data     = VkDebugUtilsMessengerCallbackDataEXT.new(cb_data_addr)
        type     = const_to_symbol(msg_type,     /^VK_DEBUG_UTILS_MESSAGE_TYPE_(.*?)_BIT_EXT$/)
        severity = const_to_symbol(msg_severity, /^VK_DEBUG_UTILS_MESSAGE_SEVERITY_(.*?)_BIT_EXT$/)
        puts ['[UTIL]', "[#{severity}]", "[#{type}]", data.pMessage.to_s].join("\t")
        VK_FALSE # don't bail
      end

      create_info = VkDebugUtilsMessengerCreateInfoEXT.malloc
      create_info.sType           = VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT
      create_info.messageSeverity = VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT |
                                    VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT |
                                    VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT
      create_info.messageType     = VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT    |
                                    VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT |
                                    VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT
      create_info.pUserData       = nil
      create_info.pfnUserCallback = @debug_util_callback

      callback_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateDebugUtilsMessengerEXT(to_ptr, create_info, nil, callback_p)
      @debug_util_callback_handle = callback_p.value
      finalize_with @vk, :vkDestroyDebugUtilsMessengerEXT, to_ptr, @debug_util_callback_handle, nil
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
