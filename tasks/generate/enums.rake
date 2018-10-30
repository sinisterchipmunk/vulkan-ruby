namespace :generate do
  desc 'generate enums'
  task :enums do
    open(generate_dir.join('enums.rb'), 'w') do |f|
      f.puts header_comment
      f.puts
      f.puts 'module Vulkan'
      vk_xml.xpath('//types/type').each do |type|
        if type.attributes['category']&.value == 'enum'
          name = type.attributes['name']&.value
          raise "enum has no name: #{type.to_s.inspect}" unless name
          f.puts "  typealias #{name.inspect}, 'int'"
        end
      end

      enums.tap do |processed_enums|
        vk_xml.xpath('//enums/enum').each do |enum|
          name = enum.attributes['name']&.value
          value = enum.attributes['value']&.value
          bitpos = enum.attributes['bitpos']&.value
          alias_name = enum.attributes['alias']&.value
          raise "enum has no name: #{enum.to_s.inspect}" unless name
          if alias_name
            raise "enum alias has not been processed yet: #{enum.to_s.inspect}" unless processed_enums[alias_name]
            f.puts "  #{name} = #{processed_enums[alias_name]}"
            processed_enums[name] = processed_enums[alias_name]
          else
            if bitpos
              value = (1 << bitpos.to_i)
            else
              value = value.sub(/(\d+)[fUL]+/, '\1') # '1.0f' => '1.0', '100U' => '100'
            end
            raise "enum has no value: #{enum.to_s.inspect}" unless value
            f.puts "  #{name} = #{value}"
            processed_enums[name] = value
          end
        end
      end

      f.puts 'end'
    end
  end
end
