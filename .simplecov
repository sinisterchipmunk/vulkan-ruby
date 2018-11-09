SimpleCov.add_filter 'vulkan/generated/'

if ENV['COVERAGE']
  SimpleCov.command_name ENV['COVERAGE']
  SimpleCov.start
end
