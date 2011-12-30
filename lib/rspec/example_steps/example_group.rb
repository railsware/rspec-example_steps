module RSpec
  module ExampleSteps
    module ExampleGroup
      def include_steps(*args)
        name = args.shift 
        shared_block = RSpec.world.shared_example_steps[name]
        shared_block or raise ArgumentError, "Could not find shared steps #{name.inspect}"
        instance_eval_with_args(*args, &shared_block)
      end

      def Given(message, options = {})
        RSpec.world.reporter.example_step_started(self, :given, message, options)
        if block_given? && !options[:pending]
          yield
          RSpec.world.reporter.example_step_passed(self, :given, message, options)
        else
          RSpec.world.reporter.example_step_pending(self, :given, message, options)
        end
      end

      def When(message, options = {})
        RSpec.world.reporter.example_step_started(self, :when, message, options)
        if block_given? && !options[:pending]
          yield
          RSpec.world.reporter.example_step_passed(self, :when, message, options)
        else
          RSpec.world.reporter.example_step_pending(self, :when, message, options)
        end
      end

      def Then(message, options = {})
        RSpec.world.reporter.example_step_started(self, :then, message, options)
        if block_given? && !options[:pending]
          yield
          RSpec.world.reporter.example_step_passed(self, :then, message, options)
        else
          RSpec.world.reporter.example_step_pending(self, :then, message, options)
        end
      end

    end
  end
end
