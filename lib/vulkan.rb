require 'fiddle'
require 'fiddle/import'
require 'pathname'
require 'rubygems/version'
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
require 'vulkan/platform'

module Vulkan
  extend Fiddle::Importer
  extend Vulkan::Platform

  class << self
    def root
      Pathname.new(__dir__).join('vulkan')
    end

    def parse_signature(sig, type_alias = @type_alias)
      super(sig, type_alias)
    end
  end

  require 'vulkan/generated'
  require 'vulkan/error'
end
