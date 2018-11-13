module Vulkan
  class DescriptorSetLayout
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    attr_reader :descriptors
    attr_reader :types

    def initialize(vk, *types, descriptors:)
      @vk = vk
      @types = types
      @descriptors = descriptors.map { |d| build_descriptor(**d) }
      value_p = Vulkan.create_value('VkDescriptorSetLayout', nil)
      check_result @vk.vkCreateDescriptorSetLayout(@vk.device, build_layout_info, nil, value_p)
      @handle = value_p.value
      finalize_with @vk, :vkDestroyDescriptorSetLayout, @vk.device, value_p.value, nil
    end

    def build_layout_info
      VkDescriptorSetLayoutCreateInfo.malloc.tap do |layout|
        layout.sType        = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO
        layout.flags        = syms_to_descriptor_set_layout_type_flags(@types)
        layout.bindingCount = descriptors.size
        layout.pBindings    = array_of_structures(@descriptors)
      end
    end

    def build_descriptor(binding:, type:, count: 1, stages:, samplers: [])
      VkDescriptorSetLayoutBinding.malloc.tap do |descr|
        descr.binding            = binding
        descr.descriptorType     = sym_to_descriptor_type(type)
        descr.descriptorCount    = count
        descr.stageFlags         = syms_to_stage_flags(stages)
        descr.pImmutableSamplers = array_of_pointers(samplers)
      end
    end
  end
end
