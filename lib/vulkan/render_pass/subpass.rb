module Vulkan
  class RenderPass
    class Subpass
      include Vulkan::Conversions

      def initialize(vk, bind_point: :graphics)
        @color_attachments    = []
        @input_attachments    = []
        @preserve_attachments = []

        @ptr = VkSubpassDescription.malloc
        @ptr.pipelineBindPoint       = sym_to_pipeline_bind_point(bind_point)
        @ptr.colorAttachmentCount    = 0
        @ptr.pColorAttachments       = nil
        @ptr.inputAttachmentCount    = 0
        @ptr.pInputAttachments       = nil
        @ptr.pResolveAttachments     = nil
        @ptr.pDepthStencilAttachment = nil
        @ptr.preserveAttachmentCount = 0
        @ptr.pPreserveAttachments    = nil
      end

      def add_attachment_ref(ary, index:, layout:, addr_mbr:, count_mbr:)
        ary << create_attachment_ref(index, layout)
        update_attachment_refs(ary, addr_mbr: addr_mbr, count_mbr: count_mbr)
      end

      def update_attachment_refs(ary, addr_mbr:, count_mbr:)
        @ptr.send(:"#{addr_mbr}=",  array_of_structures(ary))
        @ptr.send(:"#{count_mbr}=", ary.size)
      end

      def add_color_attachment_ref(index:, layout: :color)
        add_attachment_ref(@color_attachments, index: index,
                                               layout: layout,
                                               addr_mbr: :pColorAttachments,
                                               count_mbr: :colorAttachmentCount)
      end

      def add_input_attachment_ref(index:, layout:)
        add_attachment_ref(@input_attachments, index: index,
                                               layout: layout,
                                               addr_mbr: :pInputAttachments,
                                               count_mbr: :inputAttachmentCount)
      end

      def add_preserve_attachment_ref(index:, layout:)
        add_attachment_ref(@preserve_attachments, index: index,
                                                  layout: layout,
                                                  addr_mbr: :pPreserveStencilAttachments,
                                                  count_mbr: :preserveStencilAttachmentCount)
      end

      def set_depth_stencil_attachment_ref(index:, layout: :depth_stencil_attachment_optimal)
        ref = create_attachment_ref(index, layout)
        @depth_stencil_attachment = ref
        @ptr.pDepthStencilAttachment = ref
      end

      def to_ptr
        @ptr&.to_ptr
      end

      def create_attachment_ref(index, layout)
        ref = VkAttachmentReference.malloc
        ref.attachment = index # attachment index
        ref.layout = sym_to_image_layout(layout)
        ref
      end
    end
  end
end
