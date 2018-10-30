def generate_dir
  require 'pathname'
  @generate_dir ||= begin
    Pathname.new(File.expand_path('../lib/vulkan/generated', __dir__)).tap do |generate_dir|
      mkdir_p generate_dir unless generate_dir.directory?
    end
  end
end

def vk_xml_path
  @vk_xml_path ||= generate_dir.join('vk.xml')
end

def vk_xml
  @vk_xml ||= begin
    require 'nokogiri'
    Nokogiri::XML(open(vk_xml_path))
  end
end

def enums
  @enums ||= {}
end

def header_comment
  @header_comment ||= <<-end_comment.lines.map(&:strip).join("\n")
    # vulkan-ruby #{Vulkan::VERSION}
    #
    #   => https://github.com/sinisterchipmunk/vulkan-ruby
    #
    # [NOTICE] This is an automatically generated file.
  end_comment
end

def platform_type_map
  @platform_type_map ||= {
    'char'           => 'Fiddle::TYPE_CHAR',
    'signed char'    => 'Fiddle::TYPE_CHAR',
    'unsigned char'  => '-Fiddle::TYPE_CHAR',
    'short'          => 'Fiddle::TYPE_SHORT',
    'signed short'   => 'Fiddle::TYPE_SHORT',
    'unsigned short' => '-Fiddle::TYPE_SHORT',
    'int'            => 'Fiddle::TYPE_INT',
    'signed int'     => 'Fiddle::TYPE_INT',
    'unsigned int'   => '-Fiddle::TYPE_INT',
    'int64_t'        => 'Fiddle::TYPE_LONG_LONG',
    'uint64_t'       => '-Fiddle::TYPE_LONG_LONG',
    'float'          => 'Fiddle::TYPE_FLOAT',
    'double'         => 'Fiddle::TYPE_DOUBLE',
    'ptrdiff_t'      => 'Fiddle::TYPE_PTRDIFF_T',
    'void'           => 'Fiddle::TYPE_VOID',
    'void *'         => 'Fiddle::TYPE_VOIDP',
    'int8_t'         => 'Fiddle::TYPE_CHAR',
    'int32_t'        => 'Fiddle::TYPE_INT',
    'size_t'         => 'Fiddle::TYPE_SIZE_T',
    'uint8_t'        => '-Fiddle::TYPE_CHAR',
    'uint32_t'       => '-Fiddle::TYPE_INT',
  }
end
