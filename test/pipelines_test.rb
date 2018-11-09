require "test_helper"

class PipelinesTest < Minitest::Test
  def setup
    @instance = Vulkan::Instance.new extensions: []
    @device = @instance.physical_devices.first.create queues: [], extensions: []
  end

  def test_descriptors_and_layouts
    pipeline = @device.create_pipeline({extent: { width: 640, height: 480 }})
    descriptor = {
      binding: 0,
      type: :uniform_buffer,
      stages: [:vertex]
    }
    layout = pipeline.add_descriptor_set_layout descriptors: [descriptor]
    assert_equal 0,                                 layout.descriptors[0].binding
    assert_equal 1,                                 layout.descriptors[0].descriptorCount
    assert_equal VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER, layout.descriptors[0].descriptorType
    assert_equal VK_SHADER_STAGE_VERTEX_BIT,        layout.descriptors[0].stageFlags

    descriptor = {
      binding: 2,
      type: :uniform_buffer,
      stages: [:vertex],
      count: 10
    }

    layout = pipeline.add_descriptor_set_layout descriptors: [descriptor]
    assert_equal  2, layout.descriptors[0].binding
    assert_equal 10, layout.descriptors[0].descriptorCount
    assert_equal 0,  layout.build_layout_info.flags
    assert_equal 1,  layout.build_layout_info.bindingCount

    layout = pipeline.add_descriptor_set_layout :push, descriptors: [descriptor]
    assert_equal VK_DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR, layout.build_layout_info.flags

    refute_empty pipeline.layouts
  end
end
