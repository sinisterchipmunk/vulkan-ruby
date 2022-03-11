ALL_ENUMS = {}

def enum_offset(extnum, offset, dir = 1)
  base_value = 1000000000
  range_size = 1000
  (base_value + (extnum - 1) * range_size + offset) * dir
end

def find_enum_value(name)
  ALL_ENUMS.each do |category, enums|
    return enums[name] if enums.keys.include?(name)
  end
  nil
end

def resolve_enum_alias(name)
  val = find_enum_value(name)
  if val.kind_of?(Hash) && val[:alias]
    return resolve_enum_alias(val[:alias])
  else
    return val
  end
end

def process_literal_value(value)
  value.sub(/(\d+)[fFuUlL]+/, '\1')
end

namespace :generate do
  desc 'generate enums'
  task :enums do
    vk_xml.xpath('/registry/enums').each do |enums|
      raise "duplicate enums? #{enums}" if ALL_ENUMS[enums['name']]
      _enums = ALL_ENUMS[enums['name']] = {}
      enums.xpath('enum').each do |enum|
        raise "duplicate enum? #{enum}" if _enums[enum['name']]
        value = nil
        if enum['value'] then value = process_literal_value(enum['value'])
        elsif enum['alias'] then value = { alias: enum['alias'] }
        elsif enum['bitpos'] then value = 1 << enum['bitpos'].to_i
        end
        raise "could not compute enum value: #{enum}" unless value
        _enums[enum['name']] = value
      end
    end

    process_enum = proc do |enum, extnum = nil|
      extnumber = enum['extnumber'] || extnum
      if enum['extends'] && enum['offset']
        category = ALL_ENUMS[enum['extends']] || raise("Enum category not found for #{enum}")
        raise "No extnumber" unless extnumber
        value = enum_offset(extnumber.to_i, enum['offset'].to_i, enum['dir'] == '-' ? -1 : 1)
        raise "Could not compute offset for #{enum}" unless value
      elsif enum['extends'] && enum['bitpos']
        category = ALL_ENUMS[enum['extends']] || raise("Enum category not found for #{enum}")
        value = 1 << enum['bitpos'].to_i
      elsif enum['alias']
        category = ALL_ENUMS[enum['extends']] || ALL_ENUMS[nil] ||= {}
        value = { alias: enum['alias'] }
      elsif enum['extends'] && enum['value']
        category = ALL_ENUMS[enum['extends']] || raise("Enum category not found for #{enum}")
        value = process_literal_value(enum['value'])
      elsif enum['value']
        category = ALL_ENUMS[nil] ||= {}
        value = process_literal_value(enum['value'])
      else
        if find_enum_value(enum['name'])
          next # we already have a value for this so carry on
        else
          raise "Unhandled enum: #{enum}"
        end
      end

      raise "no category for #{enum}" unless category
      raise "no value for #{enum}" unless value
      existing_value = category[enum['name']]
      raise "duplicate enum? #{enum} (current: #{existing_value})" if existing_value && existing_value != value
      category[enum['name']] = value
    end

    vk_xml.xpath('/registry/feature/require/enum').each do |enum|
      process_enum.call(enum)
    end

    vk_xml.xpath('/registry/extensions/extension').each do |extension|
      extension.xpath('require/enum').each do |enum|
        process_enum.call(enum, extension['number'])
      end
    end

    open(generate_dir.join('enums.rb'), 'w') do |f|
      f.puts header_comment
      f.puts
      f.puts 'module Vulkan'

      ALL_ENUMS.each do |category, enums|
        f.puts "  # #{category}" unless category.nil?

        enums.each do |name, value|
          if value.kind_of?(Hash) && value[:alias]
            f.puts "  #{name} = #{resolve_enum_alias(value[:alias])} # Alias of #{value[:alias]}"
          else
            f.puts "  #{name} = #{value}"
          end
        end
        f.puts
      end

      f.puts 'end'
    end
  end
end
