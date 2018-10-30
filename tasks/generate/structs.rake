namespace :generate do
  desc 'generate structs'
  task structs: ['generate:types', 'generate:enums'] do
    require 'fiddle'
    open(generate_dir.join('structs.rb'), 'w') do |f|
      f.puts header_comment
      f.puts
      f.puts 'module Vulkan'
      @structs = {}
      if Fiddle::WINDOWS
        @structs['SECURITY_ATTRIBUTES'] = [
          'struct',
          nil,
          'DWORD nLength',
          'LPVOID lpSecurityDescriptor',
          'BOOL bInheritHandle'
        ]
      end
      2.times do
        @structs.tap do |processed|
          vk_xml.xpath('//types/type').each do |struct|
            if struct.attributes['category']&.value == 'struct' || struct.attributes['category']&.value == 'union'
              name = struct.attributes['name']&.value
              raise "struct has no name: #{struct.to_s.inspect}" unless name
              if alias_name = struct.attributes['alias']&.value
                raise "struct alias has not been processed yet: #{struct.to_s.inspect}" unless processed[alias_name]
                # f.puts "    #{name} = #{alias_name}"
                processed[name] = alias_name
              else
                # MyStruct = struct ['int i', 'char c', { position: ['float x', 'float y'] }]
                members = struct.xpath('member').map do |m|
                  type = m.xpath('type').text.to_s.strip
                  is_pointer = m.to_s[/<\/type>\s*\*/]
                  type = 'void' if is_pointer
                  array = m.text[/\[[0-9+]\]$/]
                  if processed[type]
                    nested_name = m.xpath('name').text.to_s.strip
                    { nested_name => type }
                  else
                    # comment = m.xpath('comment').text.to_s.strip
                    m.xpath('comment').remove
                    m.xpath('enum').each do |enum|
                      enum.content = "\#{" + enum.text + "}" unless enum.text['#{']
                    end
                    # m.text.to_s.strip
                    arylen = ''
                    arylen = "[#{m.xpath('enum').text.to_s.strip}]" if m.xpath('enum').any?
                    [type, is_pointer ? '*' : '', m.xpath('name').text.to_s.strip + arylen, array]
                  end
                end
                # processed[name] = name
                comment = struct.attributes['comment']&.value
                processed[name] = [ struct.attributes['category'].value, comment, *members ]
              end
            end
          end
        end
      end

      # flattens hashes and arrays alike into a single array of values
      totally_flatten = proc do |mbr|
        result = []
        if mbr.kind_of?(Array) || mbr.kind_of?(Hash)
          mbr.flatten.each do |elem|
            result.concat totally_flatten.call elem
          end
        else
          result << mbr
        end
        result
      end

      # sort alphabetically, then loop through each pending item, tracking
      # down dependencies and dumping them before dumping the item first.
      pending = Hash[@structs.dup.sort { |a, b| a[0] <=> b[0] }]
      dump = proc do |item|
        name, members_or_alias = *item
        pending.delete name
        # find dependencies, dump them first
        totally_flatten.call([members_or_alias]).each do |member|
          if pending.key?(member)
            dump.call [member, pending[member]]
          end
        end
        # dump item
        comment = nil
        struct_or_union = members_or_alias
        str = case members_or_alias
              when String then members_or_alias # alias
              else
                struct_or_union = members_or_alias.shift
                comment = members_or_alias.shift
                members = members_or_alias.map do |member|
                  if member.kind_of?(Hash)
                    member = member.to_a[0]
                    "{ #{member[0].inspect} => #{member[1]} }"
                  else
                    member.compact.join(' ').inspect.gsub(/\\\#/, '#')
                  end
                end
                "#{struct_or_union} [#{members.join(",\n")}]"
              end
        f.puts "  # #{comment.sub(/^\s*\/\/\s*/, '')}" if comment
        str = "  #{name} = #{str}"
        f.print str.lines.first
        f.puts str.lines[1..-1].map { |line| (" " * (name.size + struct_or_union.size + 7)) + line }.join
      end
      while pending.any?
        dump.call pending.to_a.first
        f.puts
      end
      f.puts 'end'
    end
  end
end
