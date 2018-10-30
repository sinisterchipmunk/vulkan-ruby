namespace :generate do
  desc 'generate commands'
  task :commands do
    core_features = vk_xml.css("feature[name=VK_VERSION_1_0] command").map { |command| command.attributes['name'].to_s }
    addl_features = vk_xml.css("feature command").map { |command| command.attributes['name'].to_s } - core_features
    instance_functions = vk_xml.css("require[comment='Device initialization'] command").map { |command| command.attributes['name'].to_s }

    open(generate_dir.join('commands.rb'), 'w') do |f|
      f.puts header_comment
      f.puts
      f.puts 'module Vulkan'
      aliases = []
      max_name_len = vk_xml.css("commands command proto").map { |name| name.text.size }.max
      vk_xml.xpath('//commands/command').each do |command|
        if command.attributes['name'] && command.attributes['alias']
          name = command.attributes['name'].to_s
          command_alias = command.attributes['alias'].to_s
          aliases << [name, command_alias]
          # f.puts "  def #{name}(*args); #{command_alias}(*args); end"
        else
          name = command.css('proto name').text
          next if name == 'vkGetInstanceProcAddr'
          proto = command.xpath('proto').text
          params = command.xpath('param').map(&:text).join(', ')
          if proto.to_s.strip.size == 0 || params.to_s.strip.size == 0
            puts "WARN: unhandled command: #{proto}(#{params}) (#{command.to_s})"
          else
            # if instance_functions.include?(name) || params[/^vkInstance\s/]
            #   f.puts "  lookup_instance_function #{proto.inspect.ljust(max_name_len+2)}, #{params.inspect}"
            # else
            #   f.puts "  lookup_device_function   #{proto.inspect.ljust(max_name_len+2)}, #{params.inspect}"
            # end
            f.puts "  register_function #{proto.inspect.ljust(max_name_len+2)}, #{params.inspect}"
          end
        end
        # <command successcodes="VK_SUCCESS" errorcodes="VK_ERROR_OUT_OF_HOST_MEMORY,VK_ERROR_OUT_OF_DEVICE_MEMORY,VK_ERROR_INITIALIZATION_FAILED,VK_ERROR_LAYER_NOT_PRESENT,VK_ERROR_EXTENSION_NOT_PRESENT,VK_ERROR_INCOMPATIBLE_DRIVER">
        #     <proto><type>VkResult</type> <name>vkCreateInstance</name></proto>
        #     <param>const <type>VkInstanceCreateInfo</type>* <name>pCreateInfo</name></param>
        #     <param optional="true">const <type>VkAllocationCallbacks</type>* <name>pAllocator</name></param>
        #     <param><type>VkInstance</type>* <name>pInstance</name></param>
        # </command>
      end
      # if aliases.any?
      #   f.puts "  class << self"
      #   aliases.each { |a| f.puts "    alias #{a[0].ljust(max_name_len)} #{a[1]}"}
      #   f.puts "  end"
      # end
      f.puts 'end'
    end
  end
end
