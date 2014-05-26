module RSpec
  module ExampleSteps
    module Reporter
      def process_example_step(example, type, message, options)
        example_step_started(self, type, message, options)

        if block_given? && !options[:pending]
          begin
            yield
          rescue Exception => e
            example_step_failed(self, type, message, options)
            raise e
          end
          example_step_passed(self, type, message, options)
        else
          example_step_pending(self, type, message, options)
        end
      end

      def example_step_started(example, type, message, options)
        notify :example_step_started, Notification.new(example, type, message, options)
      end

      def example_step_passed(example, type, message, options)
        notify :example_step_passed, Notification.new(example, type, message, options)
      end

      def example_step_pending(example, type, message, options)
        notify :example_step_pending, Notification.new(example, type, message, options)
      end

      def example_step_failed(example, type, message, options)
        notify :example_step_failed, Notification.new(example, type, message, options)
      end

      def registered_formatters
        @listeners.values.map(&:to_a).flatten.uniq
      end

      def find_registered_formatter(klass)
        registered_formatters.detect { |formatter| formatter.class == klass }
      end
    end
  end
end
