examples = []

namespace :examples do
  Dir[File.expand_path('../examples/*.rb', __dir__)].each do |filename|
    basename = File.basename(filename, '.rb')
    examples << "examples:#{basename}"
    desc "run the '#{basename}' example script. Influential vars: DEBUG=1, CALL_TRACE=1, MAX_FRAMES=N"
    task basename do
      ENV['COVERAGE'] = basename
      sh 'bundle', 'exec', 'ruby', filename
    end
  end
end

desc 'Run all examples. Influential vars: DEBUG=1, CALL_TRACE=1, MAX_FRAMES=N'
task examples: examples

task :default do
  # also run all examples as part of the tests
  ENV['MAX_FRAMES'] = '5'
  ENV['DEBUG'] = '1'
  Rake::Task[:examples].invoke
  puts 'Execution successful.'
end
