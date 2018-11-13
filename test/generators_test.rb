require "test_helper"

class GeneratorsTest < Minitest::Test
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
    assert File.exist?(Vulkan.root.join('generated/extensions/vk_nv_ray_tracing.rb'))

    content = File.read(Vulkan.root.join('generated/extensions.rb'))
    assert content[/require ['"]vulkan\/generated\/extensions\/vk_nv_ray_tracing/]
  end

  def test_extension_enums_have_correct_values
    content = File.read(Vulkan.root.join('generated/extensions/vk_khr_swapchain.rb'))
    assert content[/VK_KHR_SWAPCHAIN_SPEC_VERSION\s*=\s*70/]
    assert content[/VK_KHR_SWAPCHAIN_EXTENSION_NAME\s*=\s*['"]VK_KHR_swapchain['"]/]
    assert content[/VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR\s*=\s*1000001000/]
    assert content[/VK_ERROR_OUT_OF_DATE_KHR\s*=\s*-1000001004/]
  end

  def test_commands_and_params
    content = File.read(Vulkan.root.join('generated/commands.rb'))
    assert content[/register_function\s*['"]VkResult vkCreateInstance['"]\s*,\s*['"]const VkInstanceCreateInfo\* pCreateInfo, const VkAllocationCallbacks\* pAllocator, VkInstance\* pInstance['"]/]
  end

  def test_enums
    content = File.read(Vulkan.root.join('generated/enums.rb'))
    assert content[/typealias\s*['"]VkAttachmentLoadOp['"]\s*,\s*['"]int['"]/]
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
