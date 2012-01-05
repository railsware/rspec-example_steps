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
          begin
            yield
          rescue Exception => e
            RSpec.world.reporter.example_step_failed(self, :given, message, options)
            raise e
          end
          RSpec.world.reporter.example_step_passed(self, :given, message, options)
        else
          RSpec.world.reporter.example_step_pending(self, :given, message, options)
        end
      end

      def When(message, options = {})
        RSpec.world.reporter.example_step_started(self, :when, message, options)
        if block_given? && !options[:pending]
          begin
            yield
          rescue Exception => e
            RSpec.world.reporter.example_step_failed(self, :when, message, options)
            raise e
          end
          RSpec.world.reporter.example_step_passed(self, :when, message, options)
        else
          RSpec.world.reporter.example_step_pending(self, :when, message, options)
        end
      end

      def Then(message, options = {})
        RSpec.world.reporter.example_step_started(self, :then, message, options)
        if block_given? && !options[:pending]
          begin
            yield
          rescue Exception => e
            RSpec.world.reporter.example_step_failed(self, :then, message, options)
            raise e
          end
          RSpec.world.reporter.example_step_passed(self, :then, message, options)
        else
          RSpec.world.reporter.example_step_pending(self, :then, message, options)
        end
      end

      def And(message, options = {})
        RSpec.world.reporter.example_step_started(self, :and, message, options)
        if block_given? && !options[:pending]
          begin
            yield
          rescue Exception => e
            RSpec.world.reporter.example_step_failed(self, :and, message, options)
            raise e
          end
          RSpec.world.reporter.example_step_passed(self, :and, message, options)
        else
          RSpec.world.reporter.example_step_pending(self, :and, message, options)
        end
      end

      def But(message, options = {})
        RSpec.world.reporter.example_step_started(self, :but, message, options)
        if block_given? && !options[:pending]
          begin
            yield
          rescue Exception => e
            RSpec.world.reporter.example_step_failed(self, :but, message, options)
            raise e
          end
          RSpec.world.reporter.example_step_passed(self, :but, message, options)
        else
          RSpec.world.reporter.example_step_pending(self, :but, message, options)
        end
      end

    end
  end
end
