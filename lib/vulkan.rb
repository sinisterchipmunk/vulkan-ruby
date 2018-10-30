require 'pathname'
require 'rubygems/version'
require 'vulkan/version'

module Vulkan
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
  require 'vulkan/generated'
  require 'vulkan/instance'
  require 'vulkan/error'
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

  class << self
    def root
      Pathname.new(__dir__).join('vulkan')
    end
  end
end
