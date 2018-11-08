require 'vulkan/platform'

module Vulkan
  class DispatchTable
    include Vulkan::Platform

    attr_reader :instance, :device
    
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

      @instance = instance.respond_to?(:to_ptr) ? instance.to_ptr : instance
      @device   = device.respond_to?(:to_ptr)   ? device.to_ptr   : device
      raise ArgumentError, "instance must be a pointer or nil" unless @instance.nil? || @instance.kind_of?(Fiddle::Pointer)
      raise ArgumentError, "device must be a pointer or nil"   unless @device.nil?   || @device.kind_of?(Fiddle::Pointer)
    end

    def respond_to?(method_name)
      super || Vulkan.function_registry.key?(method_name)
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
      func = Fiddle::Function.new(addr, function_info[:params_types], function_info[:return_type], calling_convention, name: name)
      define_singleton_method(name) do |*params|
        call_trace(name, calling_convention_human, *params)
        func.call(*params)
      end
      send(name, *args)
    end
  end
end
