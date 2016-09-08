require 'rspec/core/formatters/documentation_formatter'
module RSpec
  module ExampleSteps
    class Formatter < ::RSpec::Core::Formatters::DocumentationFormatter

      ::RSpec::Core::Formatters.register(
        self,
        :example_started, :example_passed, :example_step_passed,
        :example_step_pending, :example_step_failed,
      )

      def example_started(notification)
        if notification.example.metadata[:with_steps]
          full_message = "#{current_indentation}#{notification.example.description}"
          output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :default)
        end
      end

      def example_passed(notification)
        super unless notification.example.metadata[:with_steps]
      end

      def example_step_passed(notification)
        full_message = "#{current_indentation}  #{notification.type.to_s.capitalize} #{notification.message}"
        output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :success)
      end

      def example_step_pending(notification)
        full_message = "#{current_indentation}  #{notification.type.to_s.capitalize} #{notification.message}"

        if notification.options[:pending] && notification.options[:pending] != true
          full_message << " (PENDING: #{notification.options[:pending]})"
        else
          full_message << " (PENDING)"
        end

        output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :pending)
      end

      def example_step_failed(notification)
        full_message = "#{current_indentation}  #{notification.type.to_s.capitalize} #{notification.message} (FAILED)"
        output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :failure)
      end
    end
  end
end
