namespace :generate do
  desc 'generate extension enums, types, etc'
  task :extensions do
    # rm_rf generate_dir.join('extensions')
    # mkdir_p generate_dir.join('extensions')
    # File.open(generate_dir.join('extensions.rb'), 'w') do |extout|
    #   extout.puts header_comment
    #   extout.puts
      
    #   vk_xml.css('extension').each do |extension|
    #     extout.puts "require 'vulkan/generated/extensions/#{extension['name'].downcase}'"
    #     extnum = extension['number'].to_i
    #     File.open(generate_dir.join('extensions/%s.rb' % extension['name'].downcase), 'w') do |f|
    #       f.puts header_comment
    #       f.puts
    #       f.puts 'module Vulkan'

    #       extension.css('enum').each do |enum|
    #         dir = enum['dir'] == '-' ? -1 : enum['dir']
    #         alias_name = enum['alias']
    #         value = enum['value'] || enum_offset(enum['extnumber'] || extnum, enum['offset'].to_i, (dir || 1).to_i)
    #         if alias_name
    #           f.puts "  #{enum['name']} = #{alias_name} unless defined?(#{enum['name']})"
    #         else
    #           f.puts "  #{enum['name']} = #{value} unless defined?(#{enum['name']})"
    #         end
    #       end

    #       f.puts 'end'
    #     end
    #   end
    # end
  end
end
