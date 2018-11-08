require "test_helper"

class DispatchTableTest < Minitest::Test
  def setup
    @instance = Vulkan::Instance.new extensions: []
    @device = @instance.physical_devices.first.create queues: [], extensions: []
  end

  def test_maintain_instance_and_device_handles
    dispatch_table = Vulkan[@instance, @device]

    # DispatchTable is the main interface passed around to other objects
    # (Vulkan::Semaphore, etc). Those objects need to be able to call `vk*`
    # methods to do stuff. If nothing else, they need it for GC purposes
    # so they can clean up after themselves. Now, by definition, a
    # DispatchTable relies on the instance and device that it was constructed
    # with. Internally, however, it technically only relies on the pointers to
    # the opaque handles (`void *`) of those objects, as returned by the
    # original calls to `vkCreate*`. So it might seem reasonable for
    # DispatchTable to eagerly coerce the instance and device into those low
    # level memory pointers, for a performance gain. It's also an
    # implementation detail that we wouldn't typically unit test. However,
    # the result of doing this (or anything like it) is that it drops the
    # references to the Vulkan::Instance and Vulkan::LogicalDevice objects
    # in Ruby. If the client code doesnt *also* keep those handles around,
    # it makes those objects eligible for garbage collection. This means that
    # the instance and/or device could be freed / destroyed while some other
    # object is still using them. So although at first glance it looks like
    # an implementation detail that a consumer of the DispatchTable shouldn't
    # need to care about, it's actually critical that DispatchTable maintains
    # a reference to those original objects.

    ivars = dispatch_table.instance_variables.map do |ivar_name|
      dispatch_table.instance_variable_get(ivar_name)
    end
    assert_includes ivars, @instance
    assert_includes ivars, @device
  end
end
