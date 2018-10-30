NAME_PADDING = 56

def pad_name(name)
  name.ljust(NAME_PADDING)
end

def base_types
  @base_types ||= {}.tap do |base_types|
    vk_xml.xpath('//types/type').each do |type|
      if type.attribute('category')&.value == 'basetype'
        name = type.xpath('name').first&.text
        ctype = type.xpath('type').first&.text
        raise "type has no name: #{type.to_s.inspect}" unless name
        raise "type has no ctype: #{type.to_s.inspect}" unless ctype
        raise "unknown platform type: #{type.to_s.inspect} (#{ctype.to_s.inspect})" unless platform_type_map[ctype]
        base_types[name] = ctype # platform_type_map[ctype]
      end
    end
  end
end

def platform_types
  @platform_types ||= {}.tap do |platform_types|
    vk_xml.xpath('//types/type').each do |type|
      if type.attribute('requires')&.value == 'vk_platform'
        name = type.attribute('name').value
        raise "type has no name: #{type.to_s.inspect}" unless name
        raise "unknown platform type: #{type.to_s.inspect} (#{name.inspect})" unless platform_type_map[name]
        platform_types[name] = platform_type_map[name]
      end
    end
  end
end

def generate_type_map(out)
  base_types.each do |name, type|
    out.puts "  typealias #{pad_name name.inspect}, '#{type}'"
  end
  @types = {}.tap do |processed_types|
    vk_xml.xpath('//types/type').each do |type|
      if type.attributes['category']&.value == 'bitmask'
        alias_name = type.attributes['alias']&.value
        name = (type.xpath('name').first&.text) ||
               (type.attributes['name']&.value)
        raise "type has no name: #{type.to_s.inspect}" unless name
        if alias_name
          raise "type alias not yet processed: #{type.to_s.inspect}" unless processed_types[alias_name]
          btype = processed_types[alias_name]
        else
          btype = type.xpath('type').first&.text
          raise "type has no base type: #{type.to_s.inspect}" unless btype
          raise "unknown base type: #{type.to_s.inspect} (#{btype.to_s.inspect})" unless base_types[btype]
          # btype = base_types[btype]
        end
        out.puts "  typealias #{pad_name name.inspect}, #{base_types[btype].inspect}"
        processed_types[name] = btype
      elsif type.attributes['category']&.value == 'handle'
        name = (type.xpath('name').first&.text) || (type.attributes['name']&.value)
        raise "type has no name: #{type.to_s.inspect}" unless name
        out.puts "  typealias #{pad_name name.inspect}, 'void *'"
        processed_types[name] = 'void *'
      elsif type.attributes['category']&.value == 'funcpointer'
        # we'll just treat function pointers as void pointers, shouldn't matter
        # as long as the signatures are correct, which we'll call a programmer
        # responsibility.
        name = (type.xpath('name').first&.text) || (type.attributes['name']&.value)
        raise "type has no name: #{type.to_s.inspect}" unless name
        out.puts "  typealias #{pad_name name.inspect}, 'void *'"
        processed_types[name] = 'void *'
      end
    end
  end
  @types.each do |name, alias_name_or_type|
    out.puts "  typealias #{pad_name name.inspect}, #{alias_name_or_type.inspect}"
  end
            
  # out.puts '    }'
end

namespace :generate do
  desc 'generate types'
  task :types do
    open(generate_dir.join('types.rb'), 'w') do |f|
      f.puts header_comment
      f.puts
      f.puts 'module Vulkan'
      generate_type_map(f)
      f.puts 'end'
    end
  end
end
