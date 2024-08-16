module Vulkan
  class Pipeline
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    attr_reader :layout
    attr_reader :input
    attr_reader :viewport
    attr_reader :scissor
    attr_reader :rasterizer
    attr_reader :multisampling
    attr_reader :blending
    attr_reader :layouts
    attr_reader :constant_ranges
    attr_reader :descriptors
    attr_accessor :specialization_constants

    # TODO support multiple viewports
    def initialize(vk, viewport: { }, scissor: { })
      @vk = vk
      @shader_stages = []
      @layouts = []
      @constant_ranges = []
      @descriptors = []
      @input = {
        topology: :triangles,
        primitive_restart: false
      }
      @viewport = {
        left: 0,
        top: 0,
        width: 640,
        height: 480,
        min_depth: 0,
        max_depth: 1
      }.merge(viewport)
      @scissor = {
        left: 0,
        top: 0,
        width: 0x7fffffff,
        height: 0x7fffffff
      }.merge(scissor)
      @rasterizer = {
        depth_clamp: false,
        discard_all: false,
        polygon_mode: :fill,
        line_width: 1.0,
        cull_mode: :back,
        front_face: :counter_clockwise,
        depth_bias: false,
        depth_bias_clamp: 0,
        depth_bias_constant: 0,
        depth_bias_slope: 0
      }
      @multisampling = {
        sample_shading: false,
        samples: 1,
        min_sample_shading: 0.2,
        sample_mask: nil,
        alpha_to_coverage: false,
        alpha_to_one: false
      }
      @blending = {
        enabled: true,
        color_writes: [ :red, :green, :blue, :alpha ],
        src_color: :src_alpha,
        dst_color: :one_minus_src_alpha,
        src_alpha: :one,
        dst_alpha: :zero,
        color_op: :add,
        alpha_op: :add
      }
      @binding_descriptions = []
      @attribute_descriptions = []
      @dynamic_states = []
      @specialization_constants = {}
    end

    def add_binding_description(binding:, stride:, input_rate:)
      binding_description = VkVertexInputBindingDescription.malloc
      binding_description.binding   = binding
      binding_description.stride    = stride
      binding_description.inputRate = sym_to_vertex_input_rate(input_rate)
      @binding_descriptions << binding_description
    end

    def add_attribute_description(binding:, location:, format:, offset:)
      attribute_description = VkVertexInputAttributeDescription.malloc
      attribute_description.binding  = binding
      attribute_description.location = location
      attribute_description.format   = sym_to_format(format)
      attribute_description.offset   = offset
      @attribute_descriptions << attribute_description
    end

    def add_descriptor_set_layout(*a, **b)
      if a.size == 1 && b.empty? && a.first.kind_of?(Vulkan::DescriptorSetLayout)
        @layouts << a[0]
      else
        Vulkan::DescriptorSetLayout.new(@vk, *a, **b).tap { |layout| @layouts << layout }
      end
    end

    def add_shader_stage(shader_stage)
      @shader_stages << shader_stage
    end

    def depth(test: true,
              write: true,
              compare_op: :less,
              bounds_test: false,
              min_bounds: 0,
              max_bounds: 1,
              stencil_test: false,
              stencil_front: nil,
              stencil_back: nil)
      @depth_stencil = VkPipelineDepthStencilStateCreateInfo.malloc
      @depth_stencil.sType                 = VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO
      @depth_stencil.depthTestEnable       = bool_to_vk(test)
      @depth_stencil.depthWriteEnable      = bool_to_vk(write)
      @depth_stencil.depthCompareOp        = sym_to_compare_op(compare_op)
      @depth_stencil.depthBoundsTestEnable = bool_to_vk(bounds_test)
      @depth_stencil.minDepthBounds        = min_bounds
      @depth_stencil.maxDepthBounds        = max_bounds
      @depth_stencil.stencilTestEnable     = bool_to_vk(stencil_test)
      # TODO stencil test options
    end

    def add_dynamic_state(which)
      @dynamic_states << which
    end

    def construct_specialization_info(specialization_constants_hash)
      specialization_info = nil
      if specialization_constants_hash&.any?
        specialization_data = ""
        specialization_entries = specialization_constants_hash.map do |id, data|
          VkSpecializationMapEntry.malloc.tap do |entry|
            entry.constantID = id
            entry.offset = specialization_data.size
            entry.size = data.size
            specialization_data << data
          end
        end
        specialization_info = VkSpecializationInfo.malloc
        specialization_info.mapEntryCount = specialization_entries.count
        specialization_info.pMapEntries = array_of_structures(specialization_entries)
        specialization_info.dataSize = specialization_data.size
        specialization_info.pData = specialization_data
      end
      specialization_info
    end

    def commit(render_pass, first_subpass_index: 0)
      @render_pass = render_pass

      shader_stage_create_infos = @shader_stages.map do |stage|
        stage_info = VkPipelineShaderStageCreateInfo.malloc
        stage_info.sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO
        stage_info.stage = syms_to_shader_stage_flags(stage.stage)
        stage_info.module = stage.module_handle
        stage_info.pName = Fiddle::Pointer[stage.entry_point]
        specs = construct_specialization_info(@specialization_constants[stage.stage])
        stage_info.pSpecializationInfo = specs
        stage_info
      end

      vertex_input_info = VkPipelineVertexInputStateCreateInfo.malloc
      vertex_input_info.sType                           = VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO
      vertex_input_info.vertexBindingDescriptionCount   = @binding_descriptions.size
      vertex_input_info.pVertexBindingDescriptions      = array_of_structures(@binding_descriptions)
      vertex_input_info.vertexAttributeDescriptionCount = @attribute_descriptions.size
      vertex_input_info.pVertexAttributeDescriptions    = array_of_structures(@attribute_descriptions)

      input_assembly = VkPipelineInputAssemblyStateCreateInfo.malloc
      input_assembly.sType                  = VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO
      input_assembly.topology               = sym_to_topology(@input[:topology])
      input_assembly.primitiveRestartEnable = bool_to_vk(@input[:primitive_restart])

      viewport = VkViewport.malloc
      viewport.x        = @viewport[:left]
      viewport.y        = @viewport[:top]
      viewport.width    = @viewport[:width]
      viewport.height   = @viewport[:height]
      viewport.minDepth = @viewport[:min_depth]
      viewport.maxDepth = @viewport[:max_depth]

      scissor = VkRect2D.malloc
      scissor.offset.x      = @scissor[:left]
      scissor.offset.y      = @scissor[:top]
      scissor.extent.width  = @scissor[:width]  == 0x7fffffff ? 0x7fffffff - @scissor[:left] : @scissor[:width]
      scissor.extent.height = @scissor[:height] == 0x7fffffff ? 0x7fffffff - @scissor[:top] : @scissor[:height]

      viewport_state = VkPipelineViewportStateCreateInfo.malloc
      viewport_state.sType         = VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO
      # TODO support multiple viewports and scissors
      viewport_state.viewportCount = 1
      viewport_state.pViewports    = viewport
      viewport_state.scissorCount  = 1
      viewport_state.pScissors     = scissor

      rasterizer = VkPipelineRasterizationStateCreateInfo.malloc
      rasterizer.sType                   = VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO
      rasterizer.depthClampEnable        = bool_to_vk(@rasterizer[:depth_clamp])
      rasterizer.rasterizerDiscardEnable = bool_to_vk(@rasterizer[:discard_all])
      rasterizer.polygonMode             = sym_to_polygon_mode(@rasterizer[:polygon_mode])
      rasterizer.lineWidth               = @rasterizer[:line_width]
      rasterizer.cullMode                = sym_to_cull_mode(@rasterizer[:cull_mode])
      rasterizer.frontFace               = sym_to_front_face(@rasterizer[:front_face])
      rasterizer.depthBiasEnable         = bool_to_vk(@rasterizer[:depth_bias])
      rasterizer.depthBiasConstantFactor = @rasterizer[:depth_bias_constant]
      rasterizer.depthBiasClamp          = @rasterizer[:depth_bias_clamp]
      rasterizer.depthBiasSlopeFactor    = @rasterizer[:depth_bias_slope]

      multisampling = VkPipelineMultisampleStateCreateInfo.malloc
      multisampling.sType                 = VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO;
      multisampling.sampleShadingEnable   = bool_to_vk(@multisampling[:sample_shading])
      multisampling.rasterizationSamples  = num_to_samples(@multisampling[:samples])
      multisampling.minSampleShading      = @multisampling[:min_sample_shading]
      multisampling.pSampleMask           = @multisampling[:sample_mask]
      multisampling.alphaToCoverageEnable = bool_to_vk(@multisampling[:alpha_to_coverage])
      multisampling.alphaToOneEnable      = @multisampling[:alpha_to_one]      ? VK_TRUE : VK_FALSE

      color_blend_attachment = VkPipelineColorBlendAttachmentState.malloc
      color_blend_attachment.colorWriteMask      = @blending[:color_writes].reduce(0) do |v, sym|
                                                     v | sym_to_color_component_bit(sym)
                                                   end
      color_blend_attachment.blendEnable         = bool_to_vk(@blending[:enabled])
      color_blend_attachment.srcColorBlendFactor = sym_to_blend_factor(@blending[:src_color])
      color_blend_attachment.dstColorBlendFactor = sym_to_blend_factor(@blending[:dst_color])
      color_blend_attachment.colorBlendOp        = sym_to_blend_op(@blending[:color_op])
      color_blend_attachment.srcAlphaBlendFactor = sym_to_blend_factor(@blending[:src_alpha])
      color_blend_attachment.dstAlphaBlendFactor = sym_to_blend_factor(@blending[:dst_alpha])
      color_blend_attachment.alphaBlendOp        = sym_to_blend_op(@blending[:alpha_op])

      color_blending = VkPipelineColorBlendStateCreateInfo.malloc
      color_blending.sType             = VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO;
      color_blending.logicOpEnable     = VK_FALSE;
      color_blending.logicOp           = VK_LOGIC_OP_COPY; # TODO
      color_blending.attachmentCount   = 1 # TODO multiple blend attachments
      color_blending.pAttachments      = color_blend_attachment
      color_blending.blendConstants[0] = 0.0 # TODO
      color_blending.blendConstants[1] = 0.0 # TODO
      color_blending.blendConstants[2] = 0.0 # TODO
      color_blending.blendConstants[3] = 0.0 # TODO

      pipeline_layout_info = VkPipelineLayoutCreateInfo.malloc
      pipeline_layout_info.sType                  = VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO
      pipeline_layout_info.setLayoutCount         = @layouts.size
      pipeline_layout_info.pSetLayouts            = array_of_structures(@layouts.map { |l| Vulkan.create_value('void *', l.to_ptr) })
      pipeline_layout_info.pushConstantRangeCount = 0 # @constant_ranges.size
      pipeline_layout_info.pPushConstantRanges    = nil # FIXME
      raise NotImplemented, 'push constant ranges not implemented' if @constant_ranges.any?

      pipeline_layout_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreatePipelineLayout(@vk.device, pipeline_layout_info, nil, pipeline_layout_p)
      @layout = pipeline_layout_p.value
      finalize_with @vk, :vkDestroyPipelineLayout, @vk.device, @layout, nil

      if @dynamic_states.any?
        dynamic_states = VkPipelineDynamicStateCreateInfo.malloc
        dynamic_states.sType = VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO
        dynamic_states.dynamicStateCount = @dynamic_states.count
        dynamic_states.pDynamicStates = array_of_uint32s(@dynamic_states.map { |state| sym_to_dynamic_state(state) })
      else
        dynamic_states = nil
      end

      pipeline_info = VkGraphicsPipelineCreateInfo.malloc
      pipeline_info.sType               = VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO
      pipeline_info.stageCount          = shader_stage_create_infos.size
      pipeline_info.pStages             = array_of_structures(shader_stage_create_infos)
      pipeline_info.pVertexInputState   = vertex_input_info
      pipeline_info.pInputAssemblyState = input_assembly
      pipeline_info.pViewportState      = viewport_state
      pipeline_info.pRasterizationState = rasterizer
      pipeline_info.pMultisampleState   = multisampling
      pipeline_info.pDepthStencilState  = @depth_stencil
      pipeline_info.pColorBlendState    = color_blending
      pipeline_info.pDynamicState       = dynamic_states
      pipeline_info.layout              = @layout
      pipeline_info.renderPass          = render_pass.to_ptr
      pipeline_info.subpass             = first_subpass_index
      pipeline_info.basePipelineHandle  = nil # TODO
      pipeline_info.basePipelineIndex   = -1 # TODO

      pipeline_p = Vulkan.create_value('void *', nil)
      check_result @vk.vkCreateGraphicsPipelines(@vk.device, nil, 1, pipeline_info, nil, pipeline_p)
      @handle = pipeline_p.value
      finalize_with @vk, :vkDestroyPipeline, @vk.device, @handle, nil
    end
  end
end
