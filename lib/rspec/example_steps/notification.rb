module RSpec
  module ExampleSteps
    class Notification < Struct.new(:example, :type, :message, :options)
    end
  end
end
