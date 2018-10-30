module Vulkan
  class Framebuffer
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer
    
    attr_reader :width
    attr_reader :height
    attr_reader :layers

    def initialize(vk, attachments:, width:, height:, render_pass:, layers: 1)
      @vk = vk
      @width = width
      @height = height
      @layers = layers

      framebuffer_info = VkFramebufferCreateInfo.malloc
      framebuffer_info.sType           = VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO
      framebuffer_info.renderPass      = render_pass
      framebuffer_info.attachmentCount = attachments.size
      framebuffer_info.pAttachments    = array_of_pointers(attachments)
      framebuffer_info.width           = width
      framebuffer_info.height          = height
      framebuffer_info.layers          = layers

      framebuffer_p = Vulkan.create_value("void *", nil)
      check_result @vk.vkCreateFramebuffer(vk.device, framebuffer_info, nil, framebuffer_p)
      @handle = framebuffer_p.value
      finalize_with vk, :vkDestroyFramebuffer, vk.device, @handle, nil
    end

    def to_ptr
      @handle
    end
  end
end
