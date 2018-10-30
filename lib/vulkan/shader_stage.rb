module Vulkan
  class ShaderStage
    include Vulkan::Checks
    include Vulkan::Finalizer

    attr_reader :entry_point, :stage

    def initialize(vk, code: nil,
                       file_path: nil,
                       entry_point: 'main',
                       stage:)
      code ||= File.read(file_path)
      @vk = vk
      @entry_point = entry_point
      @stage = stage

      code_p = Fiddle::Pointer[code]
      create_info = VkShaderModuleCreateInfo.malloc
      create_info.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
      create_info.codeSize = code.size
      create_info.pCode = code_p

      module_handle_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateShaderModule(vk.device, create_info, nil, module_handle_p)
      @module_handle = module_handle_p.value
      finalize_with vk, :vkDestroyShaderModule, vk.device, @module_handle, nil

      stage_info = VkPipelineShaderStageCreateInfo.malloc
      stage_info.sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO
      stage_info.stage = stage
      stage_info.module = @module_handle
      stage_info.pName = Fiddle::Pointer[entry_point]
      @handle = stage_info.to_ptr
    end
  end
end
