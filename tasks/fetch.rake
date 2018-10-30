desc 'fetch latest version of vk.xml'
task :fetch do
  require 'open-uri'
  require 'openssl'
  require 'vulkan/version'
  open(vk_xml_path, 'wb') do |file|
    file << open("https://raw.githubusercontent.com/KhronosGroup/Vulkan-Headers/master/registry/vk.xml", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read
  end
end
