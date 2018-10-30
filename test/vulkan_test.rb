require "test_helper"

class VulkanTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Vulkan::VERSION
  end

  def test_available_extensions
    assert_kind_of Array, Vulkan::Instance.extensions
  end

  def test_available_layers
    assert_kind_of Array, Vulkan::Instance.layers
  end
end
