module Vulkan
  class ShaderStage
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    attr_reader :entry_point, :stage, :module_handle

    def initialize(vk, code: nil,
                       file_path: nil,
                       entry_point: 'main',
                       stage:)
      code ||= File.open(file_path, 'rb') { |file| file.read }
      @vk = vk
      @entry_point = entry_point
      @stage = stage

      code_p = Fiddle::Pointer.malloc(code.size + 1)
      code_p[0, code.size] = code
      create_info = VkShaderModuleCreateInfo.malloc
      create_info.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
      create_info.codeSize = code.size
      create_info.pCode = code_p

      module_handle_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateShaderModule(vk.device, create_info, nil, module_handle_p)
      @module_handle = module_handle_p.value
      finalize_with vk, :vkDestroyShaderModule, vk.device, @module_handle, nil

      @handle = @module_handle
    end
  end
end
