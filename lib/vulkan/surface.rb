module Vulkan
  class Surface
    include Vulkan::Finalizer
    
    def initialize(instance, handle)
      @handle = handle
      finalize_with Vulkan[instance, nil], :vkDestroySurfaceKHR, instance.to_ptr, @handle, nil
    end
  end
end
