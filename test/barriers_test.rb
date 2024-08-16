require "test_helper"

class BarriersTest < Minitest::Test
  def setup
    @instance = Vulkan::Instance.new extensions: []
    @device = @instance.physical_devices.first.create queues: [], extensions: []
    @buffer = @device.create_buffer size: 64,
                                    usage: [ :transfer_dst, :vertex_buffer ],
                                    properties: :device_local
  end

  def test_buffer_memory_barrier
    # TODO test whether VkBufferMemoryBarrier or VkBufferMemoryBarrier2 is
    # used. Detect at runtime which to use depending on Vulkan version
    # (VkBufferMemoryBarrier in 1.1-, VkBufferMemoryBarrier2 in 1.2+).

    assert_kind_of Vulkan::BufferMemoryBarrier, @device.create_buffer_memory_barrier(src_access: :transfer_write,
                                                                                     dst_access: :vertex_attribute_read,
                                                                                     buffer: @buffer)

    barrier = @buffer.create_barrier src_access: :transfer_write,
                                     dst_access: :vertex_attribute_read,
                                     offset: 2,
                                     size: 32
    assert_kind_of Vulkan::BufferMemoryBarrier, barrier
    assert_equal :transfer_write, barrier.src_access
    assert_equal :vertex_attribute_read, barrier.dst_access
    assert_equal @buffer, barrier.buffer
    assert_equal 2, barrier.offset
    assert_equal 32, barrier.size

    # make sure it can be used
    command_pool = @device.create_command_pool queue_family: :ignored
    command_buffer = command_pool.create_command_buffer
    command_buffer.record do |buf|
      buf.pipeline_barriers buffer_barriers: [barrier],
                            src_stages: :transfer,
                            dst_stages: :vertex_input
    end
  end

  def test_memory_barrier
    barrier = @device.create_memory_barrier src_access: :transfer_write,
                                            dst_access: :vertex_attribute_read
    assert_kind_of Vulkan::MemoryBarrier, barrier
    assert_equal :transfer_write, barrier.src_access
    assert_equal :vertex_attribute_read, barrier.dst_access
  end
end
