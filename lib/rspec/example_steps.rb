require 'rspec/core'
require 'rspec/core/formatters'
require 'rspec/core/formatters/console_codes'
require 'rspec/core/formatters/documentation_formatter'
require 'rspec/core/example_group'
require 'rspec/core/reporter'
require 'rspec/core/world'

require 'rspec/example_steps/documentation_formatter'
require 'rspec/example_steps/example_group'
require 'rspec/example_steps/notification'
require 'rspec/example_steps/reporter'
require 'rspec/example_steps/world'

RSpec::Core::Formatters::DocumentationFormatter.send :include, RSpec::ExampleSteps::DocumentationFormatter
RSpec::Core::ExampleGroup.send                       :include, RSpec::ExampleSteps::ExampleGroup
RSpec::Core::Reporter.send                           :include, RSpec::ExampleSteps::Reporter
RSpec::Core::World.send                              :include, RSpec::ExampleSteps::World

RSpec::Core::ExampleGroup.define_example_method :Steps, with_steps: true

if formatter = RSpec.world.reporter.find_registered_formatter(RSpec::Core::Formatters::DocumentationFormatter)
 RSpec.world.reporter.register_listener formatter,
   :example_started, :example_step_passed, :example_step_pending, :example_step_failed
end

require 'rspec/example_steps/shared_steps'
include RSpec::ExampleSteps::SharedSteps
