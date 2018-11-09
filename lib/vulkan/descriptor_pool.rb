module Vulkan
  class DescriptorPool
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    def initialize(vk, flags: VK_DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT, max_sets:, pool_sizes:)
      @vk = vk
      @flags = flags
      pool_info = VkDescriptorPoolCreateInfo.malloc
      pool_info.sType         = VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO
      pool_info.poolSizeCount = pool_sizes.size
      pool_info.pPoolSizes    = array_of_structures(pool_sizes.map { |info| build_pool_size(**info) })
      pool_info.flags         = @flags
      pool_info.maxSets       = max_sets
      handle_p = Vulkan.create_value('VkDescriptorPool')
      check_result @vk.vkCreateDescriptorPool(@vk.device, pool_info, nil, handle_p)
      @handle = handle_p.value
      finalize_with @vk, :vkDestroyDescriptorPool, @vk.device, @handle, nil
    end

    def descriptor_sets_freeable?
      @flags & VK_DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT == VK_DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT
    end

    def alloc(layouts:)
      count = layouts.size
      alloc_info = VkDescriptorSetAllocateInfo.malloc
      alloc_info.sType              = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO
      alloc_info.descriptorPool     = to_ptr
      alloc_info.descriptorSetCount = count
      alloc_info.pSetLayouts        = array_of_structures(layouts.map { |layout| Vulkan.create_value('void *', layout.to_ptr.to_i) })
      sets_p = Vulkan.struct(['VkDescriptorSet sets[%d]' % count]).malloc
      check_result @vk.vkAllocateDescriptorSets(@vk.device, alloc_info, sets_p)
      count.times.map { |i| Vulkan::DescriptorSet.new(@vk, self, sets_p.sets[i], descriptor_sets_freeable?) }
    end

    def build_pool_size(type:, count:)
      VkDescriptorPoolSize.malloc.tap do |pool_size|
        pool_size.type            = sym_to_descriptor_type(type)
        pool_size.descriptorCount = count
      end
    end
  end
end
