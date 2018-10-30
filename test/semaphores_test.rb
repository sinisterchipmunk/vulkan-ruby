require "test_helper"

class VulkanSemaphoresTest < Minitest::Test
  def setup
    @instance = Vulkan::Instance.new extensions: []
    @device = @instance.physical_devices.first.create queues: [], extensions: []
  end

  def test_create_semaphores
    assert_kind_of Vulkan::Semaphore, @device.create_semaphore
  end
end
