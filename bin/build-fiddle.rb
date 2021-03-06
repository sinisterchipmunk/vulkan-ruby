# HACK, needed until such time as my fiddle PR gets merged into ruby, or else
# ruby drops its stock fiddle

require 'bundler/setup'
require 'rubygems'
require 'fileutils'
require 'rbconfig'
include FileUtils

path = Gem.loaded_specs['fiddle'].full_gem_path
chdir File.join(path, 'ext/fiddle') do
  filename = "fiddle.#{RbConfig::CONFIG['DLEXT']}"
  raise "fiddle extconf failed"                  unless system 'ruby extconf.rb'
  raise "fiddle make failed"                     unless system 'make'
  raise "fiddle make did not create #{filename}" unless File.exist?(filename)
  raise "fiddle cp failed"                       unless system "cp #{filename} ../../lib/"
end

begin
  require File.join(path, 'lib/fiddle.so')
rescue
  raise "fiddle build failed, maybe inspect file system"
end
