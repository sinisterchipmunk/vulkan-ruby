require "test_helper"

class ConversionsTest < Minitest::Test
  include Vulkan::Conversions

  def test_descriptor_set_layout_types
    assert_equal VK_DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR,
                 syms_to_descriptor_set_layout_type_flags([:push])

    assert_equal VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT_EXT,
                 syms_to_descriptor_set_layout_type_flags([:update_after_bind_pool])

    assert_equal VK_DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR |
                 VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT_EXT,
                 syms_to_descriptor_set_layout_type_flags([:push, :update_after_bind_pool])
  end

  def test_stage_flags
    assert_equal VK_SHADER_STAGE_VERTEX_BIT | VK_SHADER_STAGE_GEOMETRY_BIT | VK_SHADER_STAGE_FRAGMENT_BIT,
                 syms_to_stage_flags([:vertex, :geometry, :fragment])
    assert_equal VK_SHADER_STAGE_VERTEX_BIT,                  syms_to_stage_flags([:vertex])
    assert_equal VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT,    syms_to_stage_flags([:tessellation_control])
    assert_equal VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT, syms_to_stage_flags([:tessellation_evaluation])
    assert_equal VK_SHADER_STAGE_GEOMETRY_BIT,                syms_to_stage_flags([:geometry])
    assert_equal VK_SHADER_STAGE_FRAGMENT_BIT,                syms_to_stage_flags([:fragment])
    assert_equal VK_SHADER_STAGE_COMPUTE_BIT,                 syms_to_stage_flags([:compute])
    assert_equal VK_SHADER_STAGE_ALL_GRAPHICS,                syms_to_stage_flags([:all_graphics])
    assert_equal VK_SHADER_STAGE_ALL,                         syms_to_stage_flags([:all])
    assert_equal VK_SHADER_STAGE_TASK_BIT_NV,                 syms_to_stage_flags([:task])
    assert_equal VK_SHADER_STAGE_MESH_BIT_NV,                 syms_to_stage_flags([:mesh])
    assert_equal VK_SHADER_STAGE_RAYGEN_BIT_NV,               syms_to_stage_flags([:raygen])
    assert_equal VK_SHADER_STAGE_ANY_HIT_BIT_NV,              syms_to_stage_flags([:any_hit])
    assert_equal VK_SHADER_STAGE_CLOSEST_HIT_BIT_NV,          syms_to_stage_flags([:closest_hit])
    assert_equal VK_SHADER_STAGE_MISS_BIT_NV,                 syms_to_stage_flags([:miss])
    assert_equal VK_SHADER_STAGE_INTERSECTION_BIT_NV,         syms_to_stage_flags([:intersection])
    assert_equal VK_SHADER_STAGE_CALLABLE_BIT_NV,             syms_to_stage_flags([:callable])
  end

  def test_descriptor_types
    assert_equal VK_DESCRIPTOR_TYPE_SAMPLER,                sym_to_descriptor_type(:sampler)
    assert_equal VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER, sym_to_descriptor_type(:combined_image_sampler)
    assert_equal VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE,          sym_to_descriptor_type(:sampled_image)
    assert_equal VK_DESCRIPTOR_TYPE_STORAGE_IMAGE,          sym_to_descriptor_type(:storage_image)
    assert_equal VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER,   sym_to_descriptor_type(:uniform_texel_buffer)
    assert_equal VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER,   sym_to_descriptor_type(:storage_texel_buffer)
    assert_equal VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,         sym_to_descriptor_type(:uniform_buffer)
    assert_equal VK_DESCRIPTOR_TYPE_STORAGE_BUFFER,         sym_to_descriptor_type(:storage_buffer)
    assert_equal VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC, sym_to_descriptor_type(:uniform_buffer_dynamic)
    assert_equal VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC, sym_to_descriptor_type(:storage_buffer_dynamic)
    assert_equal VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT,       sym_to_descriptor_type(:input_attachment)
  end
end
