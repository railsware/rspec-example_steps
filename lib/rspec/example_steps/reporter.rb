module RSpec
  module ExampleSteps
    module Reporter
      def example_step_started(example, type, message)
        notify :example_step_started, example, type, message
      end

      def example_step_passed(example, type, message)
        notify :example_step_passed, example, type, message
      end

      def example_step_pending(example, type, message)
        notify :example_step_pending, example, type, message
      end

      def example_step_failed(example, type, message)
        notify :example_step_failed, example, type, message
      end
    end
  end
end
