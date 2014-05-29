## RSpec example steps

Given/When/Then/And/But steps for RSpec examples

### Installation

* For rspec v2 use gem v0.2.x or branch rspec2
* For rspec v3 user gem v3.x.x or master

<pre>
    gem 'rspec-example_steps'
</pre>

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


### Shared steps

Use _shared_steps_ do define block that will be evaluated in the context of example using _include_steps_.

Shared _steps_ behavior is simular to shared _example_ but context is example nor example_group.

### Example with shared steps

    shared_steps "login" do
      When "I go to login page" do
        page.visit '/login'
      end
      When "I put credentials" do
        page.fill_in 'Login', :with => 'jack@example.com'
        page.fill_in 'Password', :with => 'password''
      end
      Then "I should be logged in" do
        page.status_code.should == 200
        page.should have_content("Welcome jack@example.com")
      end
    end

    shared_steps "logout" do
      page.visit '/logout'
      page.status_code.should == 200
    end

    context "user flow"
      Steps "User updates profile description" do
        include_steps "login"
        When "I update profile description" do
          ...
        end
        include_steps "logout"
      end

      Steps "User updates profile avatar" do
        include_steps "login"
        When "I update profile avatar" do
          ...
        end
        include_steps "logout"
      end
    end

### Passing arguments to shared steps

It's possible to customize shared steps. See example

### Example with shared steps with arguments

    shared_steps "login" do |email, password|
      When "I go to login page" do
        page.visit '/login'
      end
      When "I put credentials" do
        page.fill_in 'Login', :with => email
        page.fill_in 'Password', :with => password
      end
    end

    shared_steps "invalid login" do
      Then "I should see login error" do
      ...
      end
    end

    Steps "User provides wrong email" do
      include_steps "login", 'jack', 'qwerty'
      include_steps "invalid login"
    end

    Steps "User provides wrong password" do
      include_steps "login", 'jack@example.com', 'bla'
      include_steps "invalid login"
    end


### Pending steps

Simular to Example :pending behavior:

    Steps "User login" do
      # just skip block
      When "I go to login"

      # pass :pending => true option
      Then "I should see welcome", :pending => true do
      ...
      end

      # pass :pending => "some pending message"
      Then "I should see last login IP", :pending => "WIP" do
      ...
      end
    end

## Authors

* [Andriy Yanko](http://ayanko.github.io)

## License

* Copyright (c) 2013 Railsware [www.railsware.com](http://www.railsware.com)
* [MIT](www.opensource.org/licenses/MIT)

## Alternatives

* [rspec-steps](https://github.com/LRDesign/rspec-steps)
* [rspec-given](https://github.com/jimweirich/rspec-given)
