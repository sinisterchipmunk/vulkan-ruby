module Vulkan
  class LogicalDevice
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer
    
    attr_reader :physical_device
    attr_reader :queue_families
    attr_reader :enabled_features

    def initialize(instance, physical_device, queues:, extensions:, features: physical_device.supported_features)
      raise ArgumentError, "instance can't be nil" unless instance
      raise ArgumentError, "physical_device can't be nil" unless physical_device
      @instance = instance
      @physical_device = physical_device

      extensions.concat ENV['DEVICE_EXTENSIONS'].split(/\:\s/) if ENV['DEVICE_EXTENSIONS']
      extensions << 'VK_KHR_portability_subset' if physical_device.extension_names.include?('VK_KHR_portability_subset')

      if queues.size == 0
        # take the first available queue, to satisfy the spec (must request a queue)
        queues = [{ family: physical_device.queue_families.first, priorities: [1.0] }]
      end

      queues_p = queues.each_with_index.map do |queue_info, index|
        family_index = queue_family_to_index(queue_info[:family])
        priorities   = queue_info[:priorities]   || raise(ArgumentError, 'queue :priorities (array of floats) is required')

        priorities = [1.0] if priorities.size == 0
        queue_priorities_p = Fiddle::Pointer.malloc(Fiddle::SIZEOF_FLOAT * priorities.size)
        priorities.each_with_index do |priority, i|
          queue_priorities_p[i * Fiddle::SIZEOF_FLOAT, Fiddle::SIZEOF_FLOAT] = [priority].pack(Fiddle::PackInfo::PACK_MAP[Fiddle::TYPE_FLOAT])
        end

        device_queue_info = VkDeviceQueueCreateInfo.malloc
        device_queue_info.sType                   = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
        device_queue_info.pNext                   = nil
        device_queue_info.flags                   = 0
        device_queue_info.queueFamilyIndex        = family_index
        device_queue_info.queueCount              = priorities.size
        device_queue_info.pQueuePriorities        = queue_priorities_p
        device_queue_info
      end
      queue_infos_p = array_of_structures(queues_p)

      extensions_p = Vulkan.struct("names[#{extensions.size}]" => ['char *name']).malloc
      extensions.each_with_index do |ext, i|
        extname = ext.kind_of?(String) ? ext : ext[:extension_name]
        extensions_p.names[i].name = Fiddle::Pointer[extname.b + "\x00"]
      end

      enabled_features = VkPhysicalDeviceFeatures.malloc
      enabled_features.to_ptr.copy_from physical_device.features.to_ptr
      enabled_features.class.members.each do |member|
        member_name = member.gsub(/[0-9A-Z]+/) { |x| "_#{x.downcase}" }.to_sym
        if features.include?(member_name)
          if enabled_features[member] == VK_FALSE
            raise Error::UnsupportedFeature.new(member_name, member)
          end
        else
          enabled_features[member] = VK_FALSE
        end
      end
      @enabled_features = struct_to_hash(enabled_features).reject! { |name, enabled| enabled != VK_TRUE }.keys

      device_create_info = VkDeviceCreateInfo.malloc
      device_create_info.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
      device_create_info.pNext = nil
      device_create_info.flags = 0
      device_create_info.queueCreateInfoCount = queues.size
      device_create_info.pQueueCreateInfos = queue_infos_p
      device_create_info.enabledLayerCount = 0 # deprecated
      device_create_info.ppEnabledLayerNames = nil
      device_create_info.enabledExtensionCount = extensions.size
      device_create_info.ppEnabledExtensionNames = extensions_p
      device_create_info.pEnabledFeatures = enabled_features

      device_wrapper = Vulkan.create_value("void *", nil)
      check_result Vulkan[instance, nil].vkCreateDevice(physical_device.to_ptr, device_create_info, nil, device_wrapper)
      @handle = device_wrapper.value
      @vk = Vulkan[instance, self]
      finalize_with Vulkan[instance, nil], :vkDestroyDevice, @handle, nil

      queue_handle_wrapper = Vulkan.create_value("void *", nil)
      @queue_families = queues.map do |queue|
        queues = queue[:priorities].each_with_index.map do |priority, index|
          @vk.vkGetDeviceQueue(@handle, queue_family_to_index(queue[:family]), index, queue_handle_wrapper)
          Vulkan::Queue.new(@vk, queue_handle_wrapper.value, index: index, priority: priority)
        end
        queue[:family].merge queues: queues
      end
    end

    def finalized=(b)
      @finalized = b
    end

    def finalized?
      !!@finalized
    end

    def to_i
      to_ptr.to_i
    end

    def max_samples
      physical_device.max_samples
    end

    def max_color_samples
      physical_device.max_color_samples
    end

    def max_depth_samples
      physical_device.max_depth_samples
    end

    def feature_enabled?(feature_name)
      @enabled_features.include?(feature_name)
    end

    def create_buffer(**args)
      Vulkan::Buffer.new(@vk, physical_device, **args)
    end

    def create_shader_stage(**args)
      Vulkan::ShaderStage.new(@vk, **args)
    end

    def create_fence(**args)
      Vulkan::Fence.new(@vk, **args)
    end

    def create_semaphore
      Vulkan::Semaphore.new(@vk)
    end

    def create_pipeline(**args)
      Vulkan::Pipeline.new(@vk, **args)
    end

    def create_swapchain(**args)
      Vulkan::Swapchain.new(@instance, self, **args)
    end

    def create_renderpass
      Vulkan::RenderPass.new(@vk)
    end

    def create_command_pool(**args)
      Vulkan::CommandPool.new(@vk, **args)
    end

    def create_descriptor_set_pool(**args)
      Vulkan::DescriptorPool.new(@vk, **args)
    end

    def create_image(**args)
      Vulkan::Image.new(@vk, physical_device, **args)
    end

    def create_sampler(**args)
      Vulkan::Sampler.new(@vk, self, **args)
    end

    def create_framebuffer(**args)
      Vulkan::Framebuffer.new(@vk, **args)
    end

    def create_buffer_memory_barrier(**args)
      Vulkan::BufferMemoryBarrier.new(**args)
    end

    def create_memory(**args)
      Vulkan::Memory.new(@vk, physical_device, **args)
    end

    def create_memory_barrier(**args)
      Vulkan::MemoryBarrier.new(**args)
    end

    def hexaddr
      to_ptr.to_i.to_s(16)
    end

    def to_ptr
      @handle
    end
  end
end
