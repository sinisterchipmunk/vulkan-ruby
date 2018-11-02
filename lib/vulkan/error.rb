module Vulkan
  class Error < StandardError
    # TODO populate these during enum generation
    CODES = {
      VK_SUCCESS                     => "Command completed successfully",
      VK_NOT_READY                   => "A fence or query has not yet completed",
      VK_TIMEOUT                     => "A wait operation has not completed in the specified time",
      VK_EVENT_SET                   => "An event is signaled",
      VK_EVENT_RESET                 => "An event is unsignaled",
      VK_INCOMPLETE                  => "A return array was too small for the result",
      VK_ERROR_OUT_OF_HOST_MEMORY    => "A host memory allocation has failed",
      VK_ERROR_OUT_OF_DEVICE_MEMORY  => "A device memory allocation has failed",
      VK_ERROR_INITIALIZATION_FAILED => "Initialization of a object has failed",
      VK_ERROR_DEVICE_LOST           => "The logical device has been lost. See <<devsandqueues-lost-device>>",
      VK_ERROR_MEMORY_MAP_FAILED     => "Mapping of a memory object has failed",
      VK_ERROR_LAYER_NOT_PRESENT     => "Layer specified does not exist",
      VK_ERROR_EXTENSION_NOT_PRESENT => "Extension specified does not exist",
      VK_ERROR_FEATURE_NOT_PRESENT   => "Requested feature is not available on this device",
      VK_ERROR_INCOMPATIBLE_DRIVER   => "Unable to find a compatible Vulkan driver",
      VK_ERROR_TOO_MANY_OBJECTS      => "Too many objects of the type have already been created",
      VK_ERROR_FORMAT_NOT_SUPPORTED  => "Requested format is not supported on this device",
      VK_ERROR_FRAGMENTED_POOL       => "A requested pool allocation has failed due to fragmentation of the pool's memory",
      VK_ERROR_OUT_OF_DATE_KHR       => "Swapchain is out of date",
      VK_SUBOPTIMAL_KHR              => "Swapchain is suboptimal"
    }

    attr_reader :code

    def initialize(code)
      raise 'BUG: error code is nil, probably a in this gem' if code.nil?
      @code = code
      super(CODES[code] || "Unknown error code: 0x#{code.to_s(16)} (#{code})")
    end
  end
end
