module Vulkan
  module Checks
    # Checks whether the result was ok, raising the appropriate error if not.
    def check_result(result)
      case result
      when VK_SUCCESS then return result
      else raise Vulkan::Error::ResultCheckError, result
      end
    end

  end
end
