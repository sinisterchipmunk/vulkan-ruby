require 'bundler/setup'
require 'simplecov'
require 'vulkan'
require 'pp'

puts 'SUPPORTED EXTENSIONS'
puts '--------------------'
puts
pp Vulkan::Instance.extensions
puts
puts

puts 'SUPPORTED LAYERS'
puts '--------------------'
puts
pp Vulkan::Instance.layers
puts
puts

puts 'PHYSICAL DEVICES'
puts '----------------'
puts
pp Vulkan::Instance.new(extensions: []).physical_devices.map { |dev| dev.to_hash }
puts
