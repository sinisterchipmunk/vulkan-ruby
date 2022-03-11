require 'vulkan/manual_types'

module Vulkan
  load_vulkan_library
  include Vulkan::ManualTypes

  class << self
    @@lookup_map = {}
    @@function_registry = {}

    # Returns a dispatch table for the given instance and device.
    def [](instance, device)
      hash = [instance, device].hash
      @@lookup_map[hash] ||= Vulkan::DispatchTable.new(instance, device)
    end

    def register_function(proto, params)
      # DispatchTable can use method_missing to know the name of a function to
      # look up, but we need to know the params and its return type, which come
      # from vk.xml and which are foreign concepts to ruby so we need to
      # persist that information for lookup within method_missing. See
      # DispatchTable#method_missing.
      signature = "#{proto}(#{params})"
      name, ctype, argtype = parse_signature(signature, Vulkan.send(:type_alias))
      function_registry[name.intern] = {
        name: name,
        return_type: ctype,
        params_types: argtype,
        prototype: proto,
        params: params,
        signature: signature
      }
    end

    def function_registry
      @@function_registry
    end
  end

  require_relative 'generated/types'
  require_relative 'generated/enums'
  require_relative 'generated/structs'

  extern "PFN_vkVoidFunction vkGetInstanceProcAddr(VkInstance instance, const char* pName)", :stdcall
  require_relative 'generated/commands'
  # require_relative 'generated/extensions'
end
