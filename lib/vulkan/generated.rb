module Vulkan
  load_vulkan_library

  typealias 'int8_t',   'char'
  typealias 'int16_t',  'short'
  typealias 'int32_t',  'int'
  typealias 'int64_t',  'long'
  typealias 'uint8_t',  'unsigned char'
  typealias 'uint16_t', 'unsigned short'
  typealias 'uint32_t', 'unsigned int'
  typealias 'uint64_t', 'unsigned long'

  # platform-specific definitions, but we need them even on alternatives,
  # or else things get complicated when parsing vk.xml
  # X11
  typealias 'Display',  'void' # HACK: since only pointers to this type are used, its size need not be known
  typealias 'VisualID', 'unsigned long'
  typealias 'XID',      'unsigned long'
  typealias 'Window',   'XID'
  typealias 'RROutput', 'XID'
  # Mir Toolkit
  typealias 'MirConnection', 'void' # HACK: since only pointers to this type are used, its size need not be known
  typealias 'MirSurface',    'void' # HACK: since only pointers to this type are used, its size need not be known
  # Wayland
  typealias 'wl_display', 'void' # HACK: since only pointers to this type are used, its size need not be known
  typealias 'wl_surface', 'void' # HACK: since only pointers to this type are used, its size need not be known
  # Windows
  typealias 'DWORD',     'unsigned long'
  typealias 'HANDLE',    'void *'
  typealias 'HINSTANCE', 'HANDLE'
  typealias 'HWND',      'HANDLE'
  typealias 'WCHAR',     'unsigned short'
  typealias 'LPCWSTR',   'WCHAR *'
  # XCB
  typealias 'xcb_connection_t', 'void' # HACK: since only pointers to this type are used, its size need not be known
  typealias 'xcb_visualid_t',   'uint32_t'
  typealias 'xcb_window_t',     'uint32_t'
  # Zircon
  typealias 'zx_handle_t', 'uint32_t'

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
  require_relative 'generated/extensions'
end
