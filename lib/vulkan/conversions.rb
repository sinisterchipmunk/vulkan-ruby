module Vulkan
  module Conversions
    IMAGE_FORMATS = {}
    IMAGE_TILING = {}
    DESCRIPTOR_TYPES = {}
    IMAGE_USAGE_BITS = {}
    IMAGE_TYPES = {}
    SHADER_STAGE_BITS = {}
    SHARING_MODES = {}
    IMAGE_CREATE_BITS = {}
    PIPELINE_STAGE_BITS = {}
    DEPENDENCY_FLAG_BITS = {}
    IMAGE_ASPECT_BITS = {}
    ACCESS_MASK_BITS = {}
    FILTERS = {}
    SAMPLER_ADDRESS_MODES = {}
    SAMPLER_MIPMAP_MODES = {}
    COMPARE_OPS = {}
    BORDER_COLORS = {}
    MEMORY_PROPERTIES = {}
    FORMAT_FEATURE_BITS = {}

    Vulkan.constants.each do |name|
      output = case name.to_s
               when /^VK_FORMAT_FEATURE_(.*?)_BIT/     then FORMAT_FEATURE_BITS
               when /^VK_FORMAT_(.*?)$/                then IMAGE_FORMATS
               when /^VK_IMAGE_TILING_(.*?)$/          then IMAGE_TILING
               when /^VK_DESCRIPTOR_TYPE_(.*?)$/       then DESCRIPTOR_TYPES
               when /^VK_IMAGE_USAGE_(.*?)_BIT/        then IMAGE_USAGE_BITS
               when /^VK_IMAGE_TYPE_(.*?)$/            then IMAGE_TYPES
               when /^VK_IMAGE_ASPECT_(.*?)_BIT/       then IMAGE_ASPECT_BITS
               when /^VK_SHADER_STAGE_(.*?)(?:_BIT|$)/ then SHADER_STAGE_BITS
               when /^VK_SHARING_MODE_(.*?)$/          then SHARING_MODES
               when /^VK_IMAGE_CREATE_(.*?)_BIT/       then IMAGE_CREATE_BITS
               when /^VK_PIPELINE_STAGE_(.*?)_BIT/     then PIPELINE_STAGE_BITS
               when /^VK_DEPENDENCY_(.*?)_BIT/         then DEPENDENCY_FLAG_BITS
               when /^VK_ACCESS_(.*?)_BIT/             then ACCESS_MASK_BITS
               when /^VK_FILTER_(.*?)$/                then FILTERS
               when /^VK_SAMPLER_ADDRESS_MODE_(.*?)$/  then SAMPLER_ADDRESS_MODES
               when /^VK_COMPARE_OP_(.*?)$/            then COMPARE_OPS
               when /^VK_BORDER_COLOR_(.*?)$/          then BORDER_COLORS
               when /^VK_SAMPLER_MIPMAP_MODE_(.*?)$/   then SAMPLER_MIPMAP_MODES
               when /^VK_MEMORY_PROPERTY_(.*?)_BIT/    then MEMORY_PROPERTIES
               else next
               end
      key = $1.downcase
      raise 'BUG: two identical constant names? %s => %s' % [name, key] if output.include?(key)
      output[key] = output[key.to_sym] = Vulkan.const_get(name)
    end

    def sym_to_samples(sym)
      # 4 => 4 because VK_SAMPLE_COUNT_4_BIT == 4.
      # But we'll keep this method here in case that changes or is not always
      # true.
      sym
    end

    def sym_to_val(sym, vals)
      vals[sym] || sym
    end

    def syms_to_flags(syms, bits)
      [syms].flatten.reduce(0) { |bit, sym| bit | sym_to_val(sym, bits) }
    end

    def sym_to_compare_op(sym)
      sym_to_val(sym, COMPARE_OPS)
    end

    def syms_to_format_feature_flags(syms)
      syms_to_flags(syms, FORMAT_FEATURE_BITS)
    end

    def syms_to_access_mask(syms)
      syms_to_flags(syms, ACCESS_MASK_BITS)
    end

    def syms_to_memory_properties(syms)
      syms_to_flags(syms, MEMORY_PROPERTIES)
    end

    def sym_to_border_color(sym)
      sym_to_val(sym, BORDER_COLORS)
    end

    def bool_to_vk(bool)
      bool ? VK_TRUE : VK_FALSE
    end

    def syms_to_pipeline_stage_flags(syms)
      syms_to_flags(syms, PIPELINE_STAGE_BITS)
    end

    def syms_to_image_aspect_flags(syms)
      syms_to_flags(syms, IMAGE_ASPECT_BITS)
    end

    def syms_to_dependency_flags(syms)
      syms_to_flags(syms, DEPENDENCY_FLAG_BITS)
    end

    def syms_to_image_create_flags(syms)
      syms_to_flags(syms, IMAGE_CREATE_BITS)
    end

    def sym_to_filter(sym)
      sym_to_val sym, FILTERS
    end

    def sym_to_sampler_address_mode(sym)
      sym_to_val sym, SAMPLER_ADDRESS_MODES
    end

    def sym_to_sampler_mipmap_mode(sym)
      sym_to_val sym, SAMPLER_MIPMAP_MODES
    end

    def sym_to_image_tiling(sym)
      sym_to_val sym, IMAGE_TILING
    end

    def syms_to_image_usage_flags(syms)
      syms_to_flags(syms, IMAGE_USAGE_BITS)
    end

    def sym_to_image_format(sym)
      sym_to_val sym, IMAGE_FORMATS
    end

    alias sym_to_format sym_to_image_format

    def sym_to_image_type(sym)
      # can't let it be a number because if it is numeric then it might
      # need to be passed-through without transformation.
      sym_to_val sym, IMAGE_TYPES
    end

    def sym_to_sharing_mode(sym)
      sym_to_val sym, SHARING_MODES
    end

    def syms_to_descriptor_set_layout_type_flags(syms)
      flags = 0
      syms.each do |sym|
        flags |= case sym
                 when :push                   then VK_DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR
                 when :update_after_bind_pool then VK_DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT_EXT
                 else sym
                 end
      end
      flags
    end

    def sym_to_descriptor_type(sym)
      DESCRIPTOR_TYPES[sym] || sym
    end

    def syms_to_stage_flags(syms)
      syms_to_flags syms, SHADER_STAGE_BITS
    end

    def sym_to_subpass_contents(sym)
      case sym
      when :inline                                then VK_SUBPASS_CONTENTS_INLINE
      when :secondary, :secondary_command_buffers then VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS
      else sym
      end
    end

    def sym_to_command_buffer_level(sym)
      case sym
      when :primary   then VK_COMMAND_BUFFER_LEVEL_PRIMARY
      when :secondary then VK_COMMAND_BUFFER_LEVEL_SECONDARY
      else sym
      end
    end

    def sym_to_command_buffer_usage(sym)
      case sym
      when :simultaneous         then VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT
      when :one_time_submit      then VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT
      when :render_pass_continue then VK_COMMAND_BUFFER_USAGE_RENDER_PASS_CONTINUE_BIT
      else sym
      end
    end

    def sym_to_index_type(sym)
      case sym
      when :uint16 then VK_INDEX_TYPE_UINT16
      when :uint32 then VK_INDEX_TYPE_UINT32
      else sym
      end
    end

    def queue_family_to_index(family)
      case family
      when nil     then VK_QUEUE_FAMILY_IGNORED
      when Numeric then family
      when Hash    then queue_family_to_index(family[:index])
      else raise ArgumentError, 'queue family must be number or hash containing :index'
      end
    end

    def sym_to_blend_factor(sym)
      case sym
      when 0, :zero                  then VK_BLEND_FACTOR_ZERO
      when 1, :one                   then VK_BLEND_FACTOR_ONE
      when :src_color                then VK_BLEND_FACTOR_SRC_COLOR
      when :one_minus_src_color      then VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR
      when :dst_color                then VK_BLEND_FACTOR_DST_COLOR
      when :one_minus_dst_color      then VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR
      when :src_alpha                then VK_BLEND_FACTOR_SRC_ALPHA
      when :one_minus_src_alpha      then VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA
      when :dst_alpha                then VK_BLEND_FACTOR_DST_ALPHA
      when :one_minus_dst_alpha      then VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA
      when :constant_color           then VK_BLEND_FACTOR_CONSTANT_COLOR
      when :one_minus_constant_color then VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR
      when :constant_alpha           then VK_BLEND_FACTOR_CONSTANT_ALPHA
      when :one_minus_constant_alpha then VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_ALPHA
      when :src_alpha_saturate       then VK_BLEND_FACTOR_SRC_ALPHA_SATURATE
      when :src1_color               then VK_BLEND_FACTOR_SRC1_COLOR
      when :one_minus_src1_color     then VK_BLEND_FACTOR_ONE_MINUS_SRC1_COLOR
      when :src1_alpha               then VK_BLEND_FACTOR_SRC1_ALPHA
      when :one_minus_src1_alpha     then VK_BLEND_FACTOR_ONE_MINUS_SRC1_ALPHA
      else sym
      end
    end

    def sym_to_blend_op(sym)
      case sym
      when :add              then VK_BLEND_OP_ADD
      when :subtract         then VK_BLEND_OP_SUBTRACT
      when :reverse_subtract then VK_BLEND_OP_REVERSE_SUBTRACT
      when :min              then VK_BLEND_OP_MIN
      when :max              then VK_BLEND_OP_MAX
      else sym
      end
    end

    def sym_to_topology(sym)
      case sym
      when :triangle, :triangles, :triangle_list then VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST
      when :point,    :points,    :point_list    then VK_PRIMITIVE_TOPOLOGY_POINT_LIST
      when :line,     :lines,     :line_list     then VK_PRIMITIVE_TOPOLOGY_LINE_LIST
      when :line_strip                           then VK_PRIMITIVE_TOPOLOGY_LINE_STRIP
      when :triangle_strip                       then VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP
      else sym
      end
    end

    def sym_to_polygon_mode(sym)
      case sym
      when :fill  then VK_POLYGON_MODE_FILL
      when :line  then VK_POLYGON_MODE_LINE
      when :point then VK_POLYGON_MODE_POINT
      else sym
      end
    end

    def sym_to_cull_mode(sym)
      case sym
      when :back           then VK_CULL_MODE_BACK_BIT
      when :front          then VK_CULL_MODE_FRONT_BIT
      when :front_and_back then VK_CULL_MODE_FRONT_AND_BACK
      when :none, nil      then VK_CULL_MODE_NONE
      else sym
      end
    end

    def sym_to_front_face(sym)
      case sym
      when :clockwise         then VK_FRONT_FACE_CLOCKWISE
      when :counter_clockwise then VK_FRONT_FACE_COUNTER_CLOCKWISE
      else sym
      end
    end

    def sym_to_color_component_bit(sym)
      case sym
      when :r, :red   then VK_COLOR_COMPONENT_R_BIT
      when :g, :green then VK_COLOR_COMPONENT_G_BIT
      when :b, :blue  then VK_COLOR_COMPONENT_B_BIT
      when :a, :alpha then VK_COLOR_COMPONENT_A_BIT
      else sym
      end
    end

    def sym_to_load_op(sym)
      case sym
      when :load           then VK_ATTACHMENT_LOAD_OP_LOAD
      when :clear          then VK_ATTACHMENT_LOAD_OP_CLEAR
      when :dont_care, nil then VK_ATTACHMENT_LOAD_OP_DONT_CARE
      else sym
      end
    end

    def sym_to_store_op(sym)
      case sym
      when :store          then VK_ATTACHMENT_STORE_OP_STORE
      when :dont_care, nil then VK_ATTACHMENT_STORE_OP_DONT_CARE
      else sym
      end
    end

    def sym_to_image_layout(sym)
      case sym
      when :undefined, nil, :any
        VK_IMAGE_LAYOUT_UNDEFINED
      when :general
        VK_IMAGE_LAYOUT_GENERAL
      when :color_optimal, :color
        VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
      when :stencil_optimal, :depth_optimal, :depth_stencil_optimal, :depth_stencil_attachment_optimal,
           :stencil,         :depth,         :depth_stencil,         :depth_stencil_attachment
        VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
      when :stencil_read_only_optimal, :stencil_ro_optimal, :stencil_read_only, :stencil_ro,
           :depth_read_only_optimal, :depth_ro_optimal, :depth_read_only, :depth_ro,
           :depth_stencil_ro_optimal, :depth_stencil_read_only, :depth_stencil_ro
        VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL
      when :shader_read_only_optimal, :shader_ro_optimal, :shader_read_only, :shader_ro
        VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
      when :transfer_src_optimal, :transfer_src, :src_optimal
        VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
      when :transfer_dst_optimal, :transfer_dst, :dst_optimal
        VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL
      when :preinitialized
        VK_IMAGE_LAYOUT_PREINITIALIZED
      when :present_src, :presentation_src, :presentment_src
        VK_IMAGE_LAYOUT_PRESENT_SRC_KHR
      else sym
      end
    end

    def sym_to_pipeline_bind_point(sym)
      case sym
      when :graphics then VK_PIPELINE_BIND_POINT_GRAPHICS
      when :compute  then VK_PIPELINE_BIND_POINT_COMPUTE
      else sym
      end
    end

    def num_to_samples(i)
      case i
      when 1  then VK_SAMPLE_COUNT_1_BIT
      when 2  then VK_SAMPLE_COUNT_2_BIT
      when 4  then VK_SAMPLE_COUNT_4_BIT
      when 8  then VK_SAMPLE_COUNT_8_BIT
      when 16 then VK_SAMPLE_COUNT_16_BIT
      when 32 then VK_SAMPLE_COUNT_32_BIT
      when 64 then VK_SAMPLE_COUNT_64_BIT
      else i
      end
    end

    def array_of_structures(ary)
      return nil if ary.nil? || ary.empty?
      size = ary.map { |struct| struct.to_ptr.size }.sum
      pointers = Fiddle::Pointer.malloc(size)
      raise ArgumentError, "size is 0?, #{ary}" if size == 0
      offset = 0
      ary.each_with_index do |addr, i|
        (pointers + offset).memcpy(addr.to_ptr)
        offset += addr.to_ptr.size
      end
      pointers
    end

    def array_of_pointers(ary, pointers = nil)
      return nil if ary.nil? || ary.empty?
      pointers ||= Fiddle::Pointer.malloc(ary.size * Fiddle::SIZEOF_VOIDP)
      ary.each_with_index do |ptr, i|
        mem = [ptr.to_ptr.to_i].pack(Fiddle::PackInfo::PACK_MAP[Fiddle::TYPE_VOIDP])
        pointers[i * Fiddle::SIZEOF_VOIDP, Fiddle::SIZEOF_VOIDP] = mem
      end
      pointers
    end

    # Converts a byte array (array of numbers) representing a null-terminated
    # C-string into a Ruby string.
    def cstr_to_rbstr(byte_array_or_ptr)
      case byte_array_or_ptr
      when Fiddle::Pointer then byte_array_or_ptr.to_s
      else byte_array_or_ptr.pack('C*').sub(/\x00*\z/, '')
      end
    end

    # Takes a version string and constructs a Vulkan packed version number
    # from it.
    def vk_make_version(version)
      version = Gem::Version.new(version)
      major, minor, patch = *version.segments
      (((major) << 22) | ((minor || 0) << 12) | (patch || 0))
    end

    # returns a Gem::Version from the specified numeric Vulkan packed version
    # number.
    def vk_parse_version(version)
      major = (version >> 22) & 0x3ff
      minor = (version >> 12) & 0x3ff
      patch = (version      ) & 0xfff
      Gem::Version.new([major, minor, patch].join('.'))
    end

    # Using the specified regular expression, scans the list of Vulkan
    # constants, looking for the first constant whose name matches the regular
    # expression AND whose value matches the given value. The return value is
    # the first regex group (`$1`) from the match, converted to a symbol.
    def const_to_symbol(val, rx)
      Vulkan.constants.each do |konst|
        if konst.to_s[rx]
          return $1.downcase.to_sym if val == Vulkan.const_get(konst)
        end
      end
      val
    end

    # Performs similarly to #const_to_symbol, but returns an array of symbols
    # for a set of matching flag names, rather than for a single value.
    def flags_to_symbols(val, rx)
      [].tap do |ary|
        Vulkan.constants.each do |konst|
          if konst.to_s[rx]
            flag_value = Vulkan.const_get(konst)
            ary << $1.downcase.to_sym if val & flag_value > 0
          end
        end
      end
    end

    # Converts a Fiddle/FFI memory struct into a simple Ruby hash, mostly for
    # happier debugging.
    def struct_to_hash(struct, initial = {})
      struct.class.members.each_with_index.inject(initial) do |hash, (member, index)|
        member = member[0] if member.kind_of?(Array)
        member_name = member.gsub(/[0-9A-Z]+/) { |x| "_#{x.downcase}" }.to_sym
        type = struct.class.types[index]
        hash.tap do |h|
          val = struct.send(member)
          val = struct_to_hash(val) if val.respond_to?(:to_ptr) && !val.kind_of?(Array)
          if val.kind_of?(Array)
            val = val.map do |v|
              if v.respond_to?(:to_ptr) && v.to_ptr.kind_of?(Fiddle::CStructEntity)
                struct_to_hash(v)
              else
                v
              end
            end
          end
          h[member_name] = val
          h[member_name] = cstr_to_rbstr(h[member_name]) if type.kind_of?(Array) && type[0] == Fiddle::TYPE_CHAR
        end
      end
    end
  end
end
