require 'bundler/setup'
require 'simplecov'
SimpleCov.start

require "vulkan"

require "minitest/autorun"

class Minitest::Test
  include Vulkan
end
