require 'fiddle'
require 'rbconfig'

module Vulkan
  module Platform
    def calling_convention_human
      case calling_convention
      when Fiddle::Function::STDCALL then :stdcall
      when Fiddle::Function::DEFAULT then :default
      else raise "BUG: can't identify calling convention???"
      end
    rescue NameError
      :default
    end

    def calling_convention
      case Vulkan.os
      when :windows then Fiddle::Function::STDCALL
      else Fiddle::Function::DEFAULT
      end
    rescue NameError
      Fiddle::Function::DEFAULT
    end

    def os
      case RbConfig::CONFIG['host_os']
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/ then :windows
      when /darwin|mac os/                            then :osx
      when /linux/, /solaris|bsd/                     then :linux
      else raise 'could not determine vulkan library to load for this OS'
      end
    end
  end
end
