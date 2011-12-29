module RSpec
  module ExampleSteps
    module ExampleGroup
      def include_steps(*args)
        name = args.shift 
        shared_block = RSpec.world.shared_example_steps[name]
        shared_block or raise ArgumentError, "Could not find shared steps #{name.inspect}"
        instance_eval_with_args(*args, &shared_block)
      end

      def Given(message)
        RSpec.world.reporter.example_step_started(self, :given, message)
        yield
        RSpec.world.reporter.example_step_passed(self, :given, message)
      end

      def When(message)
        RSpec.world.reporter.example_step_started(self, :when, message)
        yield
        RSpec.world.reporter.example_step_passed(self, :when, message)
      end

      def Then(message)
        RSpec.world.reporter.example_step_started(self, :then, message)
        yield
        RSpec.world.reporter.example_step_passed(self, :then, message)
      end
    end
  end
end
