module RSpec
  module ExampleSteps
    module ExampleGroup
      def include_steps(*args)
        name = args.shift
        shared_block = RSpec.world.shared_example_steps[name]
        shared_block or raise ArgumentError, "Could not find shared steps #{name.inspect}"
        instance_exec(*args, &shared_block)
      end

      def Given(message, options = {}, &block)
        RSpec.world.reporter.process_example_step(self, :given, message, options, &block)
      end

      def When(message, options = {}, &block)
        RSpec.world.reporter.process_example_step(self, :when, message, options, &block)
      end

      def Then(message, options = {}, &block)
        RSpec.world.reporter.process_example_step(self, :then, message, options, &block)
      end

      def And(message, options = {}, &block)
        RSpec.world.reporter.process_example_step(self, :and, message, options, &block)
      end

      def But(message, options = {}, &block)
        RSpec.world.reporter.process_example_step(self, :but, message, options, &block)
      end

    end
  end
end
