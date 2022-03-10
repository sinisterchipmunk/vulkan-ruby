require "test_helper"

class VulkanStructTest < Minitest::Test
  def test_offsetof
    s = Vulkan.struct(['int x', 'int y'])
    assert_nil s.offsetof('missing')
    assert_equal 0, s.offsetof('x')
    assert_equal Fiddle::SIZEOF_INT, s.offsetof('y')
  end

end
