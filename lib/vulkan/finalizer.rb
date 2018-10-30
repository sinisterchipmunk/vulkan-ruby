module Vulkan
  module Finalizer
    module ClassMethods
      def finalizer(vk, cleanup_method_name, *cleanup_method_args)
        proc do
          begin
            unless ENV['NO_FINALIZE']
              if ENV['CALL_TRACE']
                cleanup_method_args_s = cleanup_method_args.map do |arg|
                  arg = arg.to_ptr  if arg.respond_to?(:to_ptr)
                  arg = arg.hexaddr if arg.respond_to?(:hexaddr)
                  arg.kind_of?(Fiddle::Pointer) ? arg.to_i.to_s(16) : arg.inspect
                end
                puts "FINALIZE #{name}: #{vk.instance.to_i.to_s(16)}/#{vk.device.to_i.to_s(16)}/(#{cleanup_method_args_s.join(', ')})"
              end

              vk.send(cleanup_method_name, *cleanup_method_args)
            end
          rescue
            puts $!
            $!.backtrace.each { |line| puts "  #{line}" }
          end
        end
      end
    end

    def self.included(base)
      base.module_eval { extend Vulkan::Finalizer::ClassMethods }
    end

    def finalize_with(vk, cleanup_method_name, *cleanup_method_args)
      ObjectSpace.define_finalizer(self, self.class.finalizer(vk, cleanup_method_name, *cleanup_method_args))
    end

    def to_ptr
      @handle
    end

    def hexaddr
      to_ptr.to_i.to_s(16)
    end
  end
end
