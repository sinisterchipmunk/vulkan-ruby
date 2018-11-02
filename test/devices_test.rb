require "test_helper"

class VulkanDevicesTest < Minitest::Test
  def setup
    @instance = Vulkan::Instance.new extensions: []
  end

end
