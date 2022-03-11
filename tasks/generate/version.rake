namespace :generate do
  desc "Regenerate Vulkan API version info"
  task :version do
    header_version = nil
    vk_xml.xpath("/registry/types/type[@category='define']").each do |type|
      name = type.xpath('name')&.text.to_s
      # we are relying on VK_HEADER_VERSION to appear before VK_HEADER_VERSION_COMPLETE
      if name == 'VK_HEADER_VERSION'
        raise "could not parse header version: #{type.text}" unless type.text =~ /\s+(\d+)$/
        header_version = $1.to_i
      elsif name == 'VK_HEADER_VERSION_COMPLETE'
        raise "no header version" unless header_version
        raise "can't parse version" unless type.text =~ /\((\d+), (\d+), (\d+), VK_HEADER_VERSION/m
        full_version = [$1.to_i, $2.to_i, $3.to_i, header_version]
        open(generate_dir.join('version.rb'), 'w') do |f|
          f.puts header_comment
          f.puts
          f.puts 'module Vulkan'
          f.puts "  VK_API_VERSION_VARIANT = #{full_version[0].inspect}"
          f.puts "  VK_API_VERSION_MAJOR = #{full_version[1].inspect}"
          f.puts "  VK_API_VERSION_MINOR = #{full_version[2].inspect}"
          f.puts "  VK_API_VERSION_PATCH = #{header_version.inspect}"
          f.puts '  VK_HEADER_VERSION_COMPLETE = [VK_API_VERSION_VARIANT,'
          f.puts '                                VK_API_VERSION_MAJOR,'
          f.puts '                                VK_API_VERSION_MINOR,'
          f.puts '                                VK_API_VERSION_PATCH]'
          f.puts 'end'
        end
      end
    end
  end
end
