module RSpec
  module ExampleSteps
    module Reporter
      def self.included(base)
        base::NOTIFICATIONS.push(
          :example_step_started,
          :example_step_passed,
          :example_step_pending,
          :example_step_failed
        ) if base.constants.include?(:NOTIFICATIONS)
      end

      def example_step_started(example, type, message, options)
        notify :example_step_started, example, type, message, options
      end

      def example_step_passed(example, type, message, options)
        notify :example_step_passed, example, type, message, options
      end

      def example_step_pending(example, type, message, options)
        notify :example_step_pending, example, type, message, options
      end

      def example_step_failed(example, type, message, options)
        notify :example_step_failed, example, type, message, options
      end
    end
  end
end
