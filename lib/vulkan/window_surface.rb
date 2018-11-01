require 'vulkan/surface'

module Vulkan
  # Provides a handle to an underlying window surface based on an SDL2
  # window (or otherwise, any object which responds to `vk_create_surface`
  # and which returns the integer address of the created surface), and a
  # Vulkan instance.
  class WindowSurface < Surface
    def initialize(instance, window)
      super(instance, window.vk_create_surface(instance.to_ptr.to_i))
    end
  end
end
