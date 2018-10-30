def enum_offset(extnum, offset, dir = 1)
  base_value = 1000000000
  range_size = 1000
  (base_value + (extnum - 1) * range_size + offset) * dir
end

namespace :generate do
  desc 'generate extension enums, types, etc'
  task :extensions do
    File.open(generate_dir.join('extensions.rb'), 'w') do |extout|
      extout.puts header_comment
      extout.puts
      
      vk_xml.css('extension').each do |extension|
        extout.puts "require 'vulkan/generated/extensions/#{extension['name'].downcase}'"
        extnum = extension['number'].to_i
        File.open(generate_dir.join('extensions/%s.rb' % extension['name'].downcase), 'w') do |f|
          f.puts header_comment
          f.puts
          f.puts 'module Vulkan'

          extension.css('enum').each do |enum|
            dir = enum['dir'] == '-' ? -1 : enum['dir']
            value = enum['value'] || enum_offset(extnum, enum['offset'].to_i, (dir || 1).to_i)
            f.puts "  #{enum['name']} = #{value} unless defined?(#{enum['name']})"
          end

          f.puts 'end'
        end
      end
    end
  end
end
