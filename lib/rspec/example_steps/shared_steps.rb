module RSpec
  module ExampleSteps
    module SharedSteps

      def shared_steps(name, &block)
        ensure_shared_example_steps_name_not_taken(name)
        RSpec.world.shared_example_steps[name] = block
      end
      
      private

      def ensure_shared_example_steps_name_not_taken(name)
        if RSpec.world.shared_example_steps.has_key?(name)
          raise ArgumentError.new("Shared example steps '#{name}' already exists")
        end
      end

    end
  end
end
