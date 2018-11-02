require "test_helper"

class VulkanStructTest < Minitest::Test
  def test_offset_of
    s = Vulkan.struct(['int x', 'int y'])
    assert_raises(ArgumentError) { s.offset_of('missing') }
    assert_equal 0, s.offset_of('x')
    assert_equal Fiddle::SIZEOF_INT, s.offset_of('y')
  end

end
