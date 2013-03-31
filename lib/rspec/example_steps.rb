require 'rspec/core'
require 'rspec/core/formatters/base_formatter'
require 'rspec/core/formatters/documentation_formatter'

require 'rspec/example_steps/base_formatter'
require 'rspec/example_steps/documentation_formatter'
require 'rspec/example_steps/example_group'
require 'rspec/example_steps/reporter'
require 'rspec/example_steps/world'

RSpec::Core::Formatters::BaseFormatter.send          :include, RSpec::ExampleSteps::BaseFormatter
RSpec::Core::Formatters::DocumentationFormatter.send :include, RSpec::ExampleSteps::DocumentationFormatter
RSpec::Core::ExampleGroup.send                       :include, RSpec::ExampleSteps::ExampleGroup
RSpec::Core::Reporter.send                           :include, RSpec::ExampleSteps::Reporter
RSpec::Core::World.send                              :include, RSpec::ExampleSteps::World

if RSpec::Core::ExampleGroup.singleton_class.respond_to?(:define_example_method)
  RSpec::Core::ExampleGroup.singleton_class.define_example_method :Steps, :with_steps => true
else
  RSpec::Core::ExampleGroup.define_example_method :Steps, :with_steps => true
end

require 'rspec/example_steps/shared_steps'
include RSpec::ExampleSteps::SharedSteps
