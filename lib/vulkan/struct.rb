module Vulkan
  # Methods added into the resultant Fiddle::Struct when calling
  # Vulkan.struct
  module Struct
    module InstanceMethods
      def size
        self.class.size
      end
    end

    module ClassMethods
      def offset_of(name)
        idx = members.index(name)
        raise ArgumentError, "member not found: #{name.inspect}" unless idx

        types[0...idx].reduce(0) do |offset, type, count = 1|
          orig_offset = offset
          if type.kind_of?(Array) # type is a nested array representing a nested struct
            align = Fiddle::CStructEntity.alignment(type)
            total_size = Fiddle::CStructEntity.size(type)
          else
            align = Fiddle::PackInfo::ALIGN_MAP[type]
            total_size = Fiddle::PackInfo::SIZE_MAP[type]
          end
          offset = Fiddle::PackInfo.align(orig_offset, align) + (total_size * (count || 1))
        end
      end
    end
  end
end
