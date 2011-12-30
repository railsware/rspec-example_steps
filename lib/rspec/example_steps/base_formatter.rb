module RSpec
  module ExampleSteps
    module BaseFormatter
      def example_step_started(example, type, message, options)
      end

      def example_step_passed(example, type, message, options)
      end

      def example_step_pending(example, type, message, options)
      end

      def example_step_failed(example, type, message, options)
      end
    end
  end
end
