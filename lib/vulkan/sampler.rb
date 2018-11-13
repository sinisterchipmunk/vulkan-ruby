module Vulkan
  class Sampler
    include Vulkan::Checks
    include Vulkan::Conversions
    include Vulkan::Finalizer

    def initialize(vk, device,
                       mag_filter: :linear,
                       min_filter: :linear,
                       address_mode_u: :repeat,
                       address_mode_v: :repeat,
                       address_mode_w: :repeat,
                       anisotropy: device.feature_enabled?(:sampler_anisotropy),
                       max_anisotropy: anisotropy ? 16 : 1,
                       border_color: :int_opaque_black,
                       unnormalized_coords: false,
                       compare: false,
                       compare_op: :always,
                       mipmap_mode: :linear,
                       mip_lod_bias: 0,
                       min_lod: 0,
                       max_lod: 0
                  )
      sampler_info = VkSamplerCreateInfo.malloc
      sampler_info.sType                   = VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO
      sampler_info.magFilter               = sym_to_filter(mag_filter)
      sampler_info.minFilter               = sym_to_filter(min_filter)
      sampler_info.addressModeU            = sym_to_sampler_address_mode(address_mode_u)
      sampler_info.addressModeV            = sym_to_sampler_address_mode(address_mode_v)
      sampler_info.addressModeW            = sym_to_sampler_address_mode(address_mode_w)
      sampler_info.anisotropyEnable        = bool_to_vk(anisotropy)
      sampler_info.maxAnisotropy           = max_anisotropy
      sampler_info.borderColor             = sym_to_border_color(border_color)
      sampler_info.unnormalizedCoordinates = bool_to_vk(unnormalized_coords)
      sampler_info.compareEnable           = bool_to_vk(compare)
      sampler_info.compareOp               = sym_to_compare_op(compare_op)
      sampler_info.mipmapMode              = sym_to_sampler_mipmap_mode(mipmap_mode)
      sampler_info.mipLodBias              = mip_lod_bias
      sampler_info.minLod                  = min_lod
      sampler_info.maxLod                  = max_lod
    
      handle_p = Vulkan.create_value('void *', nil)
      check_result vk.vkCreateSampler(vk.device, sampler_info, nil, handle_p)
      @handle = handle_p.value
      finalize_with vk, :vkDestroySampler, vk.device, @handle, nil
    end
  end
end
