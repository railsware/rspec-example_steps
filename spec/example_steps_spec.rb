require 'spec_helper'

describe "example steps" do

  describe "Given/When/Then" do

    Steps "should execute blocks" do
      Given "thing" do
        @thing = "Given value"
      end

      When "action" do
        @action = "When value"
      end

      Then "result" do
        @result = "Then value"
      end

      And "and" do
        @and = "And value"
      end

      But "but" do
        @but = "But value"
      end

      @thing.should  == "Given value"
      @action.should == "When value"
      @result.should == "Then value"
      @and.should == "And value"
      @but.should == "But value"
    end
  end


  describe "Steps without blocks" do
    Steps "they should be pending" do
      Given "step without block"
      Then "step without block"
      When "step without block"
    end
  end

  describe "Steps with :pending option" do
    Steps "they should be pending when :pending => true" do
      Given "step with :pending option", :pending => true do
        raise "Should not be evaluated"
      end

      When "step with :pending option", :pending => true do
        raise "Should not be evaluated"
      end

      Then "step with :pending option", :pending => true do
        raise "Should not be evaluated"
      end

      And "and step with :pending option", :pending => true do
        raise "Should not be evaluated"
      end

      But "and step with :pending option", :pending => true do
        raise "Should not be evaluated"
      end
    end

    Steps "they should be pending when :pending => STRING" do
      Given "step with :pending option", :pending => "WIP" do
        raise "Should not be evaluated"
      end

      When "step with :pending option", :pending => "POSTPONED" do
        raise "Should not be evaluated"
      end

      Then "step with :pending option", :pending => "DELAYED" do
        raise "Should not be evaluated"
      end
    end

    Steps "they should NOT be pending when :pending => false" do
      Given "step with :pending option", :pending => false do
      end

      When "step with :pending option", :pending => false do
      end

      Then "step with :pending option", :pending => false do
      end

      And "step with :pending option", :pending => false do
      end

      But "step with :pending option", :pending => false do
      end
    end
  end
end
