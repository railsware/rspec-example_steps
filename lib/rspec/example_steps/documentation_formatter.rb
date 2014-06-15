module RSpec
  module ExampleSteps
    module DocumentationFormatter
      def self.included(base)
        base.class_eval do
          include InstanceMethods

          alias :example_started_without_steps :example_started
          alias :example_started :example_started_with_steps

          alias :example_passed_without_steps :example_passed
          alias :example_passed :example_passed_with_steps
        end
      end

      module InstanceMethods
        def example_started(notification)
        end

        def example_started_with_steps(notification)
          example_started_without_steps(notification)

          if notification.example.metadata[:with_steps]
            full_message = "#{current_indentation}#{notification.example.description}"
            output.puts Core::Formatters::ConsoleCodes.wrap(full_message, :default)
          end
        end

        def example_passed_with_steps(notification)
          example_passed_without_steps(notification) unless notification.example.metadata[:with_steps]
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
end
