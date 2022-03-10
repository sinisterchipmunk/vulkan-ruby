lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vulkan/version"

Gem::Specification.new do |spec|
  spec.name          = "vulkan-ruby"
  spec.version       = Vulkan::VERSION
  spec.authors       = ["Colin MacKenzie IV"]
  spec.email         = ["sinisterchipmunk@gmail.com"]

  spec.summary       = %q{Vulkan bindings for Ruby}
  spec.homepage      = "https://github.com/sinisterchipmunk/vulkan-ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://www.rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 3.1.1'
  spec.add_development_dependency "bundler",       "~> 2.1"
  spec.add_development_dependency "rake",          "~> 13.0"
  spec.add_development_dependency "minitest",      "~> 5.15"
  spec.add_development_dependency "nokogiri",      '~> 1.8' # used to process vk.xml
  spec.add_development_dependency 'sdl2_vulkan',   '~> 0.1' # used by the examples
  spec.add_development_dependency 'cglm',          '~> 0.1'
  spec.add_development_dependency 'simplecov',     '~> 0.16'
  spec.add_development_dependency 'chunky_png',    '~> 1.3'
  spec.add_development_dependency 'oily_png',      '~> 1.2'
  spec.add_development_dependency 'tiny_obj',      '~> 0.2'
  spec.add_dependency 'sorted_set'
end
