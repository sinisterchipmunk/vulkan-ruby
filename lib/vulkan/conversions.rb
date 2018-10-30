module Vulkan
  module Conversions
    def bool_to_vk(bool)
      bool ? VK_TRUE : VK_FALSE
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

    def queue_family_to_index(family)
      case family
      when Numeric then family
      when Hash then queue_family_to_index(family[:index])
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
      when :stencil_optimal, :depth_optimal, :depth_stencil_optimal,
           :stencil,         :depth,         :depth_stencil
        VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
      when :stencil_read_only_optimal, :stencil_ro_optimal, :stencil_read_only, :stencil_ro,
           :depth_read_only_optimal, :depth_ro_optimal, :depth_read_only, :depth_ro,
           :depth_stencil_optimal, :depth_stencil_ro_optimal, :depth_stencil_read_only,
           :depth_stencil_ro
        VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL
      when :shader_read_only_optimal, :shader_ro_optimal, :shader_read_only, :shader_ro
        VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
      when :transfer_src_optimal, :transfer_src
        VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
      when :transfer_dst_optimal, :transfer_dst
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
      size = ary.map { |struct| struct.to_ptr.size }.sum
      pointers = Fiddle::Pointer.malloc(size)
      offset = 0
      ary.each_with_index do |addr, i|
        (pointers + offset).memcpy(addr.to_ptr)
        offset += addr.to_ptr.size
      end
      pointers
    end

    def array_of_pointers(ary, pointers = Fiddle::Pointer.malloc(ary.size * Fiddle::SIZEOF_VOIDP))
      ary.each_with_index do |ptr, i|
        mem = [ptr.to_ptr.to_i].pack(Fiddle::PackInfo::PACK_MAP[Fiddle::TYPE_VOIDP])
        pointers[i * Fiddle::SIZEOF_VOIDP, Fiddle::SIZEOF_VOIDP] = mem
      end
      pointers
    end

    # Converts a byte array (array of numbers) representing a null-terminated
    # C-string into a Ruby string.
    def cstr_to_rbstr(byte_array)
      byte_array.pack('C*').sub(/\x00*\z/, '')
    end

    # Takes a version string and constructs a Vulkan packed version number
    # from it.
    def vk_make_version(version)
      version = Gem::Version.new(version)
      major, minor, patch = *version.segments
      (((major) << 22) | ((minor || 0) << 12) | (patch || 0))
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
          val = struct_to_hash(val) if val.respond_to?(:to_ptr)
          h[member_name] = val
          h[member_name] = cstr_to_rbstr(h[member_name]) if type.kind_of?(Array) && type[0] == Fiddle::TYPE_CHAR
        end
      end
    end
  end
end
