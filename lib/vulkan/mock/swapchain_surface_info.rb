module Vulkan
  module Mock
    # A mock object that you can use in your unit testing. This way you can
    # construct Vulkan-ish data for testing against that doesn't depend on any
    # underlying hardware. All of the properties of this object are optional,
    # and sane (but arbitary) defaults will be provided for anything omitted.
    class SwapchainSurfaceInfo
      # These values were chosen arbitrarily.
      DEFAULT_CAPABILITIES = {
        min_image_count: 0,
        max_image_count: 10,
        current_extent: { width: 800, height: 600 },
        min_image_extent: { width: 1, height: 1 },
        max_image_extent: { width: 8192, height: 8192 },
        max_image_array_layers: 128,
        supported_transforms: [ :identity, :rotate_90, :rotate_180,
                                :rotate_270, :horizontal_mirror,
                                :horizontal_mirror_rotate_90,
                                :horizontal_mirror_rotate_180,
                                :horizontal_mirror_rotate_270,
                                :inherit ],
        current_transform: [ :identity ],
        supported_composite_alpha: [ :opaque, :pre_multiplied, :post_multiplied, :inherit ],
        supported_usage: [ :transfer_src, :transfer_dst, :sampled, :storage,
                           :color_attachment, :depth_stencil_attachment,
                           :transient_attachment, :input_attachment ]
      }

      attr_reader :presentation_modes
      attr_reader :formats
      attr_reader :capabilities

      def initialize(presentation_modes: [:fifo, :mailbox, :immediate],
                     formats: [{ format: :r8g8b8a8_snorm, color_space: :srgb_nonlinear }],
                     **capabilities)
        @presentation_modes = presentation_modes
        @formats = formats
        @capabilities = DEFAULT_CAPABILITIES.merge(capabilities)
      end
    end
  end
end
