require "test_helper"

class SwapchainBuilderTest < Minitest::Test
  include Vulkan

  def test_choosing_presentation_mode
    # Degrade from best quality to worst quality, but allow app config to
    # override as long as the override option is supported.

    surface_info = Mock::SwapchainSurfaceInfo.new presentation_modes: [:fifo, :immediate, :mailbox, :fifo_relaxed]
    swapchain = SwapchainBuilder.new(surface_info)
    # triple buffered, should never tear
    assert_equal :mailbox, swapchain.presentation_mode

    surface_info = Mock::SwapchainSurfaceInfo.new presentation_modes: [:fifo, :immediate, :fifo_relaxed]
    swapchain = SwapchainBuilder.new(surface_info)
    # double buffered - force vsync, always show most recent frame. Should
    # never tear, may perform worse than mailbox but uses less memory.
    assert_equal :fifo, swapchain.presentation_mode

    surface_info = Mock::SwapchainSurfaceInfo.new presentation_modes: [:fifo_relaxed, :immediate]
    swapchain = SwapchainBuilder.new(surface_info)
    # as with fifo, but tearing is allowed after first vsync - may tear if
    # framerate is lower than refresh rate
    assert_equal :fifo_relaxed, swapchain.presentation_mode

    surface_info = Mock::SwapchainSurfaceInfo.new presentation_modes: [:immediate]
    swapchain = SwapchainBuilder.new(surface_info)
    # no buffering, display frame immediately. Will probably tear.
    assert_equal :immediate, swapchain.presentation_mode

    # test app config overrides
    surface_info = Mock::SwapchainSurfaceInfo.new presentation_modes: [:fifo, :immediate, :mailbox, :fifo_relaxed]
    swapchain = SwapchainBuilder.new(surface_info, graphics: { swapchain: { vsync: false } })
    assert_equal :immediate, swapchain.presentation_mode

    surface_info = Mock::SwapchainSurfaceInfo.new presentation_modes: [:fifo, :immediate, :mailbox, :fifo_relaxed]
    swapchain = SwapchainBuilder.new(surface_info, graphics: { swapchain: { presentation_mode: :fifo_relaxed } })
    assert_equal :fifo_relaxed, swapchain.presentation_mode

    surface_info = Mock::SwapchainSurfaceInfo.new presentation_modes: [:fifo, :immediate, :mailbox, :fifo_relaxed]
    swapchain = SwapchainBuilder.new(surface_info, graphics: { swapchain: { presentation_mode: :invalid } })
    assert_equal :mailbox, swapchain.presentation_mode

    assert_raises do
      surface_info = Mock::SwapchainSurfaceInfo.new presentation_modes: []
      swapchain = SwapchainBuilder.new(surface_info)
      swapchain.presentation_mode
    end
  end

  def test_choosing_number_of_swapchain_images
    surface_info = Mock::SwapchainSurfaceInfo.new min_image_count: 1, max_image_count: 1
    swapchain = SwapchainBuilder.new(surface_info)
    assert_equal 1, swapchain.image_count

    surface_info = Mock::SwapchainSurfaceInfo.new min_image_count: 1, max_image_count: 0
    swapchain = SwapchainBuilder.new(surface_info)
    assert_equal 2, swapchain.image_count

    surface_info = Mock::SwapchainSurfaceInfo.new min_image_count: 1, max_image_count: 10
    swapchain = SwapchainBuilder.new(surface_info)
    assert_equal 2, swapchain.image_count
  end

  def test_usage_support
    surface_info = Mock::SwapchainSurfaceInfo.new supported_usage: [:transfer_dst]
    swapchain = SwapchainBuilder.new(surface_info)
    assert swapchain.usage_supported?
  
    assert_raises do
      surface_info = Mock::SwapchainSurfaceInfo.new supported_usage: []
      swapchain = SwapchainBuilder.new(surface_info)
    end
  end

  def test_transformation
    # use identity by default
    surface_info = Mock::SwapchainSurfaceInfo.new supported_transforms: [:identity, :rotate_90],
                                                          current_transform: [:rotate_90]
    swapchain = SwapchainBuilder.new(surface_info)
    assert_equal :identity, swapchain.transformation

    # fail over to whatever is currently selected
    surface_info = Mock::SwapchainSurfaceInfo.new supported_transforms: [],
                                                          current_transform: [:rotate_90]
    swapchain = SwapchainBuilder.new(surface_info)
    assert_equal [:rotate_90], swapchain.transformation
  end

  def test_choosing_swapchain_image_dimensions
    surface_info = Mock::SwapchainSurfaceInfo.new current_extent: { width: 800, height: 600 },
                                                          min_image_extent: { width: 320, height: 200 },
                                                          max_image_extent: { width: 8192, height: 8192 }
    swapchain = SwapchainBuilder.new(surface_info)
    assert_equal [1024, 768], swapchain.dimensions(1024, 768)

    swapchain = SwapchainBuilder.new(surface_info)
    assert_equal [320, 200], swapchain.dimensions(0, 0)

    swapchain = SwapchainBuilder.new(surface_info)
    assert_equal [8192, 8192], swapchain.dimensions(10000, 10000)

    surface_info.capabilities[:current_extent] = { width: -1, height: -1 }
    swapchain = SwapchainBuilder.new(surface_info, window: { width: 2048, height: 1536 })
    assert_equal [2048, 1536], swapchain.dimensions

    surface_info.capabilities[:current_extent] = { width: -1, height: -1 }
    swapchain = SwapchainBuilder.new(surface_info, graphics: { swapchain: { width: 2048, height: 1536 } })
    assert_equal [2048, 1536], swapchain.dimensions

    surface_info.capabilities[:current_extent] = { width: -1, height: -1 }
    surface_info.capabilities[:min_image_extent] = { width: 1024, height: 768 }
    swapchain = SwapchainBuilder.new(surface_info)
    assert_equal [1024, 768], swapchain.dimensions
  end
end
