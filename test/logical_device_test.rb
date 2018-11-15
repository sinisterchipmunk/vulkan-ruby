require "test_helper"

class LogicalDeviceTest < Minitest::Test
  include Conversions

  def test_cannot_activate_an_unsupported_feature
    instance = Vulkan::Instance.new extensions: []
    physical = instance.physical_devices.first
    # test is invalid on hardware that supports *everything*
    return if physical.unsupported_features.empty?

    assert_raises Vulkan::Error::UnsupportedFeature do
      physical.create queues: [], extensions: [], features: physical.unsupported_features
    end
  end

  def test_disabling_a_feature_does_not_make_it_unsupported
    instance = Vulkan::Instance.new extensions: []
    physical = instance.physical_devices.first
    # test is invalid on hardware that supports *nothing*
    return if physical.supported_features.empty?
    logical = physical.create queues: [], extensions: [], features: []

    refute physical.supported_features.empty?
    refute logical.feature_enabled?(physical.supported_features.first)
    assert struct_to_hash(physical.features)[physical.supported_features.first] == VK_TRUE
  end

  def test_enabled_features
    instance = Vulkan::Instance.new extensions: []
    physical = instance.physical_devices.first
    device = physical.create queues: [], extensions: [], features: physical.supported_features

    assert_kind_of Array, device.enabled_features
    supported_features = device.physical_device.supported_features
    unsupported_features = device.physical_device.unsupported_features
    device.enabled_features.each do |feature|
      assert supported_features.include?(feature)
      refute unsupported_features.include?(feature)
    end
  end
end
