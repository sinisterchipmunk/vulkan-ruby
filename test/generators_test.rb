require "test_helper"

class GeneratorsTest < Minitest::Test
  def test_VkImageBlit_offsets_are_arrays
    assert_equal 2, VkImageBlit.malloc.srcOffsets.size
    assert_equal 2, VkImageBlit.malloc.dstOffsets.size
  end

  def test_version
    assert_kind_of Array, VK_HEADER_VERSION_COMPLETE
    assert_equal 4, VK_HEADER_VERSION_COMPLETE.size
    # current version at time of writing
    assert VK_HEADER_VERSION_COMPLETE[0] >= 0
    assert VK_HEADER_VERSION_COMPLETE[1] >= 1
    assert VK_HEADER_VERSION_COMPLETE[2] >= 3
    assert VK_HEADER_VERSION_COMPLETE[3] >= 207
  end

  def test_uint32_pointer_in_swapchain_create_info_struct
    content = File.read(Vulkan.root.join('generated/structs.rb'))
    content[/VkSwapchainCreateInfoKHR\s*=\s*struct\s*\[(.*?)\]/m]
    struct_content = $1
    refute_nil struct_content
    assert_match(/uint32_t\s*\*\s*pQueueFamilyIndices/, struct_content)
  end

  def test_structs_containing_arrays_with_enum_sizes
    content = File.read(Vulkan.root.join('generated/structs.rb'))
    content[/VkPhysicalDeviceMemoryProperties\s*=\s*struct\s*\[(.*?)\]$/m]
    struct_content = $1
    refute_nil struct_content
    assert_match(/memoryTypes\s*\[.*?=>\s*VkMemoryType/, struct_content)
  end

  def test_extensions_discovered
    assert_equal "VK_NV_ray_tracing", VK_NV_RAY_TRACING_EXTENSION_NAME
  end

  def test_extension_enums_have_correct_values
    assert_equal 1000001000, VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR
    assert_equal -1000001004, VK_ERROR_OUT_OF_DATE_KHR
  end

  def test_commands_and_params
    content = File.read(Vulkan.root.join('generated/commands.rb'))
    assert content[/register_function\s*['"]VkResult vkCreateInstance['"]\s*,\s*['"]const VkInstanceCreateInfo\* pCreateInfo, const VkAllocationCallbacks\* pAllocator, VkInstance\* pInstance['"]/]
  end

  def test_enums
    assert Vulkan.struct(['VkAttachmentLoadOp i']).malloc
    assert Vulkan.struct(['GgpFrameToken i']).malloc
    assert_equal 1000.0, VK_LOD_CLAMP_NONE
  end

  def test_structs_containing_arrays
    content = File.read(Vulkan.root.join('generated/structs.rb'))
    assert content[/VkClearColorValue\s*=\s*union\s*\["float\s*float32\s*\[4\]",/]
  end

  def test_types
    content = File.read(Vulkan.root.join('generated/types.rb'))
    assert content[/typealias\s*['"]VkSampleMask['"]\s*,\s*['"]uint32_t['"]/]
  end
end
