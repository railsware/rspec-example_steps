require 'rspec/example_steps/base_formatter'
require 'rspec/example_steps/documentation_formatter'
require "rspec/example_steps/example_group"
require 'rspec/example_steps/reporter'

RSpec::Core::Formatters::BaseFormatter.send          :include, RSpec::ExampleSteps::BaseFormatter
RSpec::Core::Formatters::DocumentationFormatter.send :include, RSpec::ExampleSteps::DocumentationFormatter
RSpec::Core::ExampleGroup.send                       :include, RSpec::ExampleSteps::ExampleGroup
RSpec::Core::Reporter.send                           :include, RSpec::ExampleSteps::Reporter

RSpec::Core::ExampleGroup.define_example_method :Steps, :with_steps => true
