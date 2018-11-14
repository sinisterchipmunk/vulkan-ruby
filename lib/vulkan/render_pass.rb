module Vulkan
  class RenderPass
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    attr_reader :attachments

    def initialize(vk)
      @vk = vk
      @attachments = []
      @subpasses = []
    end

    def to_ptr
      super || raise(RuntimeError, 'call #commit first')
    end

    def commit
      render_pass_info = VkRenderPassCreateInfo.malloc
      render_pass_info.sType = VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO
      render_pass_info.attachmentCount = @attachments.size
      render_pass_info.pAttachments = array_of_structures(@attachments)
      render_pass_info.subpassCount = @subpasses.size
      render_pass_info.pSubpasses = array_of_structures(@subpasses)

      dependency = VkSubpassDependency.malloc
      dependency.srcSubpass = VK_SUBPASS_EXTERNAL
      dependency.dstSubpass = 0
      dependency.srcStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT
      dependency.srcAccessMask = 0
      dependency.dstStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT
      dependency.dstAccessMask = VK_ACCESS_COLOR_ATTACHMENT_READ_BIT | VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT
      
      render_pass_info.dependencyCount = 1
      render_pass_info.pDependencies = dependency

      render_pass_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateRenderPass(@vk.device, render_pass_info, nil, render_pass_p)
      @handle = render_pass_p.value
      finalize_with @vk, :vkDestroyRenderPass, @vk.device, @handle, nil
    end

    def add_attachment(format:,
                       samples: 1,
                       load_op: :clear,
                       store_op: :store,
                       stencil_load_op: :dont_care,
                       stencil_store_op: :dont_care,
                       initial_layout: nil,
                       final_layout: :presentation_src)
      attachment = VkAttachmentDescription.malloc
      attachment.format         = sym_to_image_format(format)
      attachment.samples        = num_to_samples(samples)
      attachment.loadOp         = sym_to_load_op(load_op)
      attachment.storeOp        = sym_to_store_op(store_op)
      attachment.stencilLoadOp  = sym_to_load_op(stencil_load_op)
      attachment.stencilStoreOp = sym_to_store_op(stencil_store_op)
      attachment.initialLayout  = sym_to_image_layout(initial_layout)
      attachment.finalLayout    = sym_to_image_layout(final_layout)
      @attachments << attachment
      @attachments.size - 1
    end

    def add_subpass(**args)
      subpass = Vulkan::RenderPass::Subpass.new(@vk, **args)
      @subpasses << subpass
      subpass
    end
  end
end
