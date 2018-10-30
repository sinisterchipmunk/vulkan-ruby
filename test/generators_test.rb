require "test_helper"

class GeneratorsTest < Minitest::Test
  def test_extensions
    assert File.exist?(Vulkan.root.join('generated/extensions/vk_nvx_raytracing.rb'))
  end
end
