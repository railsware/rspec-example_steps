## RSpec example steps

Given/When/Then steps for RSpec examples

### Example

    require 'rspec/example_steps'

    context "Searching" do
      Steps "Result found" do
        Given "I am on search page" do
          page.visit("/search")
          page.should have_content("Search")
        end

        When "I search something" do
          page.fill_in('Search', :with => 'John')
          page.click_button "Go"
        end

        Then "I should see result" do
          page.should have_content("Result")
        end
      end
    end

### Documentation formatting output:

    Searching
      User succesfully replaces device
        Given I am on search page
        When I search something
        Then I should see result

## References

* [rspec-steps](https://github.com/LRDesign/rspec-steps)
* [rspec-given](https://github.com/jimweirich/rspec-given)
