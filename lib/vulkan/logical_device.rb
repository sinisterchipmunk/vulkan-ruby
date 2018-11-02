module Vulkan
  class LogicalDevice
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer
    
    attr_reader :physical_device
    attr_reader :queue_families

    def initialize(instance, physical_device, queues:, extensions:)
      raise ArgumentError, "instance can't be nil" unless instance
      raise ArgumentError, "physical_device can't be nil" unless physical_device
      @instance = instance
      @physical_device = physical_device

      extensions.concat ENV['DEVICE_EXTENSIONS'].split(/\:\s/) if ENV['DEVICE_EXTENSIONS']

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
      device_create_info.pEnabledFeatures = physical_device.features

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

    def create_vertex_buffer(**args)
      Vulkan::VertexBuffer.new(@vk, physical_device, **args)
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

    def create_pipeline(swapchain)
      Vulkan::Pipeline.new(@vk, swapchain)
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

    def hexaddr
      to_ptr.to_i.to_s(16)
    end

    def to_ptr
      @handle
    end
  end
end
