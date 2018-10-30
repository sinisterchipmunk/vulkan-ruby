require 'bundler/setup'
require 'vulkan'
require 'pp'

instance = Vulkan::Instance.new(extensions: [])
pp({
  'supported extensions' => Vulkan::Instance.extensions,
  'supported layers'     => Vulkan::Instance.layers,
  'physical devices'     => instance.physical_devices.map { |dev| dev.to_hash }
})
