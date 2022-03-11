# Include the manually specified types here, and then we will skip them while
# processing vk.xml if they are encountered. This way, all special cases need
# only be added to that file to be properly dealt with everywhere.
require 'vulkan/manual_types'
::ManualTypes = Class.new do
  extend Fiddle::Importer
  # HACK, fiddle only initializes this if we call dlload which we don't need here
  @type_alias = {}
  include Vulkan::ManualTypes
end.new

TYPE_ALIASES = {}

# Returns an array whose entries are 2-element arrays containing first the
# name of the type to be created, and second the name of the type that it is
# an alias of. The return value is sorted such that types that depend on
# other types appear later.
def resolve_type_aliases(aliases = TYPE_ALIASES.dup)
  result = []
  aliases.dup.each do |name, alias_of|
    next if aliases[alias_of] # we want only leaf nodes
    aliases.delete name
    result << [name, alias_of]
  end
  result.concat resolve_type_aliases(aliases) unless aliases.empty?
  result
end

namespace :generate do
  desc 'generate types'
  task :types do
    open(generate_dir.join('types.rb'), 'w') do |f|
      f.puts header_comment
      f.puts
      f.puts 'module Vulkan'

      vk_xml.xpath('/registry/types/type').each do |type|
        raise "duplicate type? #{type}" if TYPE_ALIASES[type['name']]
        value = nil
        # skip types we can't make use of
        next if type['category'] == 'include'

        name = type['name'] || type.xpath('name')&.text.to_s
        name = nil if name.size == 0
        if name
          # skip C types defined by Fiddle (see lib/fiddle/cparser.rb #parse_ctype)
          next if %w( char void int double float size_t ssize_t short ).include?(name)
          # skip types we manually defined
          next if ::ManualTypes.class.send(:type_alias).key?(name)
        end

        # types that depend on an external dependency, which we don't have access
        # to. Try to define a default for them, which may or may not be correct.
        # Note they won't be defined if they are already typealias'ed everywhere.
        # We do this for a few known types in lib/vulkan/generated.rb.
        # FIXME is there a better solution? Do nothing? Always manually define them?
        if type['requires'] && type['requires'][/\.h/]
          raise "No type name for #{type}" unless name
          f.puts "  typealias '#{name}', 'void *' unless send(:type_alias).key?('#{name}') # defined in #{type['requires']}"
        elsif type['category'] == 'define'
          raise "No type name for #{type}" unless name
          next if name['VERSION']
          f.puts "  #{name} = 0 # dummy value, its real value could not be converted"
        elsif type['category'] == 'basetype'
          _type = type.xpath('type')&.text
          raise "No type name for #{type}" unless name
          if _type.size == 0
            # we are about to choose type 'void' in hopes that it will only ever
            # be used as a pointer (void *). In case we are wrong, check whether
            # it was manually specified in lib/vulkan/generated.rb first. Then
            # we can address these on a case by case basis.
            f.puts "  typealias '#{name}', 'void' unless send(:type_alias).key?('#{name}')"
          else
            f.puts "  typealias '#{name}', '#{_type}'"
          end
        elsif type['category'] == 'bitmask'
          _type = type.xpath('type')&.text
          _type = nil if _type&.size == 0
          raise "No type name for #{type}" unless name.size > 0
          if _type
            f.puts "  typealias '#{name}', '#{_type}'"
          elsif type['alias']
            TYPE_ALIASES[name] = type['alias']
          end
        elsif type['category'] == 'handle'
          # all handles are pointers
          raise "No type name for #{type}" unless name.size > 0
          f.puts "  typealias '#{name}', 'void *' # handle"
        elsif type['category'] == 'enum'
          # FIXME we shouldn't assume an enum is an int, it could be smaller
          # depending on the compiler.
          raise "No type name for #{type}" unless name.size > 0
          f.puts "  typealias '#{name}', 'int' # enum"
        elsif type['category'] == 'funcpointer'
          # function pointers are pointers.
          # TODO do something with the arguments? Not sure fiddle knows/cares.
          raise "No type name for #{type}" unless name.size > 0
          f.puts "  typealias '#{name}', 'void *' # function pointer"
        elsif type['category'] == 'struct' || type['category'] == 'union'
          # structs and unions are handled by the generate:structs task.
        else
          raise "Unhandled type: #{type.to_s}"
        end
      end

      resolve_type_aliases.each do |type_alias|
        f.puts "  typealias '#{type_alias[0]}', '#{type_alias[1]}'"
      end

      f.puts 'end'
    end
  end
end
