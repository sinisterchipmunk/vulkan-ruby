require 'vulkan/generated/version'

module Vulkan
  VULKAN_RUBY_VERSION = [ 3 ]

  VERSION = [ VK_API_VERSION_MAJOR,
              VK_API_VERSION_MINOR,
              VK_API_VERSION_PATCH,
              *VULKAN_RUBY_VERSION ].join('.')
end
