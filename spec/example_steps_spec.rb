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

      @thing.should  == "Given value"
      @action.should == "When value"
      @result.should == "Then value"
    end
  end

end
