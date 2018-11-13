require 'fiddle'
require 'fiddle/import'
require 'pathname'
require 'rubygems/version'
require 'vulkan/platform'
require 'vulkan/struct'

module Vulkan
  extend Fiddle::Importer
  extend Vulkan::Platform

  class << self
    def struct(*args)
      klass = super
      klass.send(:include, Vulkan::Struct::InstanceMethods)
      klass.send(:extend,  Vulkan::Struct::ClassMethods)
      klass
    end

    def root
      Pathname.new(__dir__).join('vulkan')
    end

    def parse_signature(sig, type_alias = @type_alias)
      super(sig, type_alias)
    end

    def vulkan_library_candidates
      [
        ENV['PATH_TO_VULKAN'],
        *case os
         when :windows then ['vulkan-1.dll']
         when :osx     then ['libvulkan.dylib', 'libvulkan.1.dylib', 'libMoltenVK.dylib']
         when :linux   then ['libvulkan.so', 'libvulkan.so.1']
         else               []
         end
      ].compact
    end

    def load_vulkan_library
      candidates = vulkan_library_candidates
      begin
        dlload candidates.shift
      rescue
        retry if candidates.any?
        raise "could not determine vulkan library to load for this OS (#{os.inspect}): try passing PATH_TO_VULKAN"
      end
    end
  end

  require 'vulkan/generated'
  require 'vulkan/error'
end

require 'vulkan/version'
require 'vulkan/checks'
require 'vulkan/conversions'
require 'vulkan/finalizer'
require 'vulkan/framebuffer'
require 'vulkan/surface'
require 'vulkan/pipeline'
require 'vulkan/window_surface'
require 'vulkan/dispatch_table'
require 'vulkan/physical_device'
require 'vulkan/logical_device'
require 'vulkan/instance'
require 'vulkan/queue_family'
require 'vulkan/swapchain'
require 'vulkan/swapchain_surface_info'
require 'vulkan/swapchain_builder'
require 'vulkan/image_view'
require 'vulkan/shader_stage'
require 'vulkan/render_pass'
require 'vulkan/render_pass/subpass'
require 'vulkan/command_pool'
require 'vulkan/command_buffer'
require 'vulkan/semaphore'
require 'vulkan/fence'
require 'vulkan/queue'
require 'vulkan/buffer'
require 'vulkan/descriptor_pool'
require 'vulkan/descriptor_set'
require 'vulkan/descriptor_set_layout'
require 'vulkan/image'
require 'vulkan/memory'
require 'vulkan/buffer_memory'
require 'vulkan/image_memory'
require 'vulkan/sampler'
