require "test_helper"

class ConversionsTest < Minitest::Test
  include Vulkan::Conversions

  def test_sym_to_samples
    assert_equal VK_SAMPLE_COUNT_1_BIT,  sym_to_samples( 1)
    assert_equal VK_SAMPLE_COUNT_2_BIT,  sym_to_samples( 2)
    assert_equal VK_SAMPLE_COUNT_4_BIT,  sym_to_samples( 4)
    assert_equal VK_SAMPLE_COUNT_8_BIT,  sym_to_samples( 8)
    assert_equal VK_SAMPLE_COUNT_16_BIT, sym_to_samples(16)
    assert_equal VK_SAMPLE_COUNT_32_BIT, sym_to_samples(32)
    assert_equal VK_SAMPLE_COUNT_64_BIT, sym_to_samples(64)
    assert_equal 99,                     sym_to_samples(99)
  end

  def test_array_of_pointers
    assert_nil array_of_pointers(nil)
    assert_nil array_of_pointers([])
  end

  def test_array_of_structures
    assert_nil array_of_structures(nil)
    assert_nil array_of_structures([])
  end

  def test_queue_family_to_index
    assert_equal                       1, queue_family_to_index(1)
    assert_equal                       1, queue_family_to_index({ index: 1 })
    assert_equal VK_QUEUE_FAMILY_IGNORED, queue_family_to_index(nil)
    assert_raises(ArgumentError) { queue_family_to_index(Object.new) }
  end

  def test_syms_to_image_usage_flags
    assert_equal VK_IMAGE_USAGE_TRANSFER_SRC_BIT, syms_to_image_usage_flags([:transfer_src])
    assert_equal VK_IMAGE_USAGE_TRANSFER_SRC_BIT | VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT,
                 syms_to_image_usage_flags([:transfer_src, :depth_stencil_attachment])
    assert_equal(-1, syms_to_image_usage_flags(-1))
    assert_equal 1 | 2 | 4, syms_to_image_usage_flags([1, 2, 4])
    assert_equal VK_IMAGE_USAGE_TRANSFER_SRC_BIT, syms_to_image_usage_flags(:transfer_src)
  end

  def test_sym_to_image_tiling
    assert_equal VK_IMAGE_TILING_OPTIMAL, sym_to_image_tiling(:optimal)
    assert_equal VK_IMAGE_TILING_LINEAR,  sym_to_image_tiling(:linear)
    assert_equal 100,                     sym_to_image_tiling(100)
  end

  def test_sym_to_image_type
    assert_equal VK_IMAGE_TYPE_1D, sym_to_image_type(:'1d')
    assert_equal VK_IMAGE_TYPE_2D, sym_to_image_type(:'2d')
    assert_equal VK_IMAGE_TYPE_3D, sym_to_image_type(:'3d')
    assert_equal 100,              sym_to_image_type(100)
  end

  def test_sym_to_image_format
    assert_equal VK_FORMAT_R8G8B8A8_UNORM,       sym_to_image_format(:r8g8b8a8_unorm)
    assert_equal VK_FORMAT_R32G32B32A32_UINT,    sym_to_image_format(:r32g32b32a32_uint)
    assert_equal VK_FORMAT_ASTC_8x6_UNORM_BLOCK, sym_to_image_format(:astc_8x6_unorm_block)
    assert_equal(-1,                             sym_to_image_format(-1))
  end

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
