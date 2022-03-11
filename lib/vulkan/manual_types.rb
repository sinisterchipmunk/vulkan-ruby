require 'fiddle/import'
require 'fiddle/types'

module Vulkan
  # Defines types manually that could not be auto generated from vk.xml.
  # A type defined here will be skipped if encountered while processing
  # vk.xml.
  module ManualTypes
    def self.included(base)
      base.module_eval do
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
        # Wayland
        typealias 'wl_display', 'void' # HACK: since only pointers to this type are used, its size need not be known
        typealias 'wl_surface', 'void' # HACK: since only pointers to this type are used, its size need not be known
        # Windows
        include Fiddle::Win32Types
        typealias 'WCHAR',     'unsigned short'
        typealias 'LPCWSTR',   'WCHAR *'
        # XCB
        typealias 'xcb_connection_t', 'void' # HACK: since only pointers to this type are used, its size need not be known
        typealias 'xcb_visualid_t',   'uint32_t'
        typealias 'xcb_window_t',     'uint32_t'
        # Zircon
        typealias 'zx_handle_t', 'uint32_t'
      end
    end
  end
end
