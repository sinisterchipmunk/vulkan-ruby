module Vulkan
  class DispatchTable
    attr_reader :instance, :device
    
    def initialize(instance, device)
      @instance = instance.respond_to?(:to_ptr) ? instance.to_ptr : instance
      @device   = device.respond_to?(:to_ptr)   ? device.to_ptr   : device
      raise ArgumentError, "instance must be a pointer or nil" unless @instance.nil? || @instance.kind_of?(Fiddle::Pointer)
      raise ArgumentError, "device must be a pointer or nil"   unless @device.nil?   || @device.kind_of?(Fiddle::Pointer)
    end

    def respond_to?(method_name)
      super || Vulkan.function_registry.key?(method_name)
    end

    def call_trace(name, *params)
      if ENV['CALL_TRACE']
        args_s = params.map do |arg|
          arg = arg.to_ptr if arg.respond_to?(:to_ptr)
          arg.kind_of?(Fiddle::Pointer) ? arg.to_i.to_s(16) : arg.inspect
        end
        puts "CALL: #{@instance.to_i.to_s(16)}/#{@device.to_i.to_s(16)}/#{name}(#{args_s.join(', ')})"
      end
    end

    def vkGetInstanceProcAddr(*args)
      call_trace(:vkGetInstanceProcAddr, *args)
      Vulkan.vkGetInstanceProcAddr(*args)
    end

    def method_missing(name, *args)
      super unless respond_to?(name)
      function_info = Vulkan.function_registry[name]

      if @instance.nil? || @device.nil? || name == :vkGetDeviceProcAddr
        # instance function
        puts "LOOKUP: Looking up instance function #{name.inspect}" if ENV['CALL_TRACE']
        addr = vkGetInstanceProcAddr(@instance, name.to_s)
      else
        # device function, but fall back to instance if device func lookup fails
        puts "LOOKUP: Looking up device function #{name.inspect}" if ENV['CALL_TRACE']
        addr = vkGetDeviceProcAddr(@device, name.to_s)
        if addr.to_i == 0
          puts "LOOKUP: Not a device function - Looking up instance function #{name.inspect}" if ENV['CALL_TRACE']
          addr = vkGetInstanceProcAddr(@instance, name.to_s)
        end
      end

      super if addr.to_i == 0 # method not found
      func = Fiddle::Function.new(addr, function_info[:params_types], function_info[:return_type])
      define_singleton_method(name) do |*params|
        call_trace(name, *params)
        func.call(*params)
      end
      send(name, *args)
    end
  end
end
