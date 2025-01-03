require 'vulkan/platform'

module Vulkan
  class DispatchTable
    include Vulkan::Platform

    def initialize(instance, device)
      # NOTE it's important we keep handles to both instance and device to
      # avoid garbage collection of those objects if they should go out of
      # scope in the greater program. As long as anyone keeps a handle to
      # this dispatch table, they are still using both the device and
      # instance, and premature GC of those objects can be catastrophic
      # (segfaults). Because of the #to_ptr below, this may constitute a bit
      # of a refactor later on, for clarity's sake -- but for now merely
      # keeping the handles around is good enough.
      @_instance = instance
      @_device   = device
      raise ArgumentError, "instance must be a Vulkan::Instance or nil" unless @_instance.nil? || @_instance.kind_of?(Vulkan::Instance)
      raise ArgumentError, "device   must be a Vulkan::LogicalDevice or nil" unless @_device.nil? || @_device.kind_of?(Vulkan::LogicalDevice)

      @instance = instance&.to_ptr
      @device   = device&.to_ptr
      @instance_functions = []
      @device_functions = []
    end

    def instance
      @_instance
    end

    def device
      @_device
    end

    def respond_to?(method_name)
      super || Vulkan.function_registry.key?(method_name)
    end

    def inspect
      "#<#{self.class} instance@#{@instance.to_i.to_s(16)} device@#{@device.to_i.to_s(16)}>"
    end

    def call_trace(name, calling_convention, *params)
      if ENV['CALL_TRACE']
        args_s = params.map do |arg|
          arg = arg.to_ptr if arg.respond_to?(:to_ptr)
          arg.kind_of?(Fiddle::Pointer) ? arg.to_i.to_s(16) : arg.inspect
        end
        suffix = " as #{calling_convention}" if calling_convention != :default
        puts "CALL: #{@instance.to_i.to_s(16)}/#{@device.to_i.to_s(16)}/#{name}(#{args_s.join(', ')})#{suffix}"
      end
    end

    def vkGetInstanceProcAddr(*args)
      call_trace(:vkGetInstanceProcAddr, calling_convention_human, *args)
      Vulkan.vkGetInstanceProcAddr(*args)
    end

    def method_missing(name, *args)
      super unless respond_to?(name)

      # Calling vkDestroyInstance will implicitly free everything associated
      # with it; at shutdown, since order of finalization is not guaranteed,
      # the instance may be already destroyed and this can lead to
      # double-freeing and crashing (at least this is true on Mac as of
      # vulkan-sdk 1.3.296.0). So to avoid crashing on shutdown, we'll
      # try to discard any 'vkDestroy' associated with an instance after
      # vkDestroyInstance is already called.

      function_info = Vulkan.function_registry[name]
      is_instance_function = false
      if @instance.nil? || @device.nil? || name == :vkGetDeviceProcAddr
        # instance function 
        puts "LOOKUP: Looking up instance function #{name.inspect}" if ENV['CALL_TRACE']
        return nil if @_instance&.finalized?
        addr = vkGetInstanceProcAddr(@instance, name.to_s)
        is_instance_function = true if addr.to_i != 0
      else
        # device function, but fall back to instance if device func lookup fails
        puts "LOOKUP: Looking up device function #{name.inspect}" if ENV['CALL_TRACE']
        return nil if @_instance&.finalized? || @_device&.finalized?
        addr = vkGetDeviceProcAddr(@device, name.to_s)
        if addr.to_i == 0
          puts "LOOKUP: Not a device function - Looking up instance function #{name.inspect}" if ENV['CALL_TRACE']
          addr = vkGetInstanceProcAddr(@instance, name.to_s)
          is_instance_function = true if addr.to_i != 0
        end
      end

      super if addr.to_i == 0 # method not found
      func = Fiddle::Function.new(addr, function_info[:params_types], function_info[:return_type], calling_convention, name: name)
      # Better performance if we're not constantly checking the name of every
      # method we just called.
      stubber = case name
                when :vkDestroyInstance then proc { stub_vk_instance_methods }
                when :vkDestroyDevice   then proc { stub_vk_device_methods   }
                else nil
                end
      define_singleton_method(name) do |*params|
        call_trace(name, calling_convention_human, *params)
        func.call(*params).tap { stubber&.call }
      end
      (is_instance_function ? @instance_functions : @device_functions) << name
      send(name, *args)
    end

    def stub_vk_instance_methods
      @_instance&.finalized = true
      @instance_functions.each do |name|
        define_singleton_method(name) do |*params|
          # to avoid crashing by calling a method on an already destroyed
          # instance, do nothing.
        end
      end
      stub_vk_device_methods
    end

    def stub_vk_device_methods
      @_device&.finalized = true
      @device_functions.each do |name|
        define_singleton_method(name) do |*params|
          # to avoid crashing by calling a method on an already destroyed
          # instance, do nothing.
        end
      end
    end
  end
end
