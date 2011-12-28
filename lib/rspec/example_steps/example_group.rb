module RSpec
  module ExampleSteps
    module ExampleGroup
      def Given(message)
        ::RSpec.configuration.reporter.example_step_started(self, :given, message)
        yield
        ::RSpec.configuration.reporter.example_step_passed(self, :given, message)
      end

      def When(message)
        ::RSpec.configuration.reporter.example_step_started(self, :when, message)
        yield
        ::RSpec.configuration.reporter.example_step_passed(self, :when, message)
      end

      def Then(message)
        ::RSpec.configuration.reporter.example_step_started(self, :then, message)
        yield
        ::RSpec.configuration.reporter.example_step_passed(self, :then, message)
      end
    end
  end
end
