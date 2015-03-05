## RSpec example steps

Given/When/Then/And/But steps for RSpec examples

### Description

This gem brings two major functionality to your `spec/features`

* Verbosity for rspec documentation formatter.
* Ability to comment or describe set of actions in example into some step.

### Installation

* For rspec v2 use gem **v0.2.x** or rspec2 branch
* For rspec v3 use gem **v3.x.x** or master branch

```ruby
gem 'rspec-example_steps'
```

Add to `spec/spec_helper.rb`

```ruby
require 'rspec/example_steps'
```

### Example

`spec/features/search_spec.rb`

```ruby
context 'Searching' do
  Steps 'Result found' do
    Given 'I am on search page' do
      visit '/search'
      expect(page).to have_content('Search')
    end

    When 'I search something' do
      fill_in 'Search', with: 'John'
      click_button 'Go'
    end

    Then 'I should see result' do
      expect(page).to have_content('Result')
    end
  end
end
```

### Documentation formatting output:

`rspec -fd spec/features/search_spec.rb`

<pre>
Searching
  User succesfully replaces device
    Given I am on search page
    When I search something
    Then I should see result
</pre>

### Shared steps

Use _shared_steps_ do define block that will be evaluated in the context of example using _include_steps_.

Shared _steps_ behavior is simular to shared _example_ but context is example nor example_group.

### Example with shared steps

```ruby
shared_steps 'login' do
  When 'I go to login page' do
    visit '/login'
  end
  When 'I put credentials' do
    fill_in 'Login', with: 'jack@example.com'
    fill_in 'Password', with: 'password'
  end
  Then 'I should be logged in' do
    expect(page).to have_content('Welcome jack@example.com')
  end
end

shared_steps 'logout' do
  visit '/logout'
  expect(page.status_code).to eq(200)
end

context 'user flow'
  Steps 'User updates profile description' do
    include_steps 'login'
    When 'I update profile description' do
      ...
    end
    include_steps 'logout'
  end

  Steps 'User updates profile avatar' do
    include_steps 'login'
    When 'I update profile avatar' do
      ...
    end
    include_steps 'logout'
  end
end
```

### Passing arguments to shared steps

It's possible to customize shared steps. See example

### Example with shared steps with arguments

```ruby
shared_steps 'login' do |email, password|
  When 'I go to login page' do
    page.visit '/login'
  end
  When 'I put credentials' do
    fill_in 'Login', with: email
    fill_in 'Password', with: password
  end
end

shared_steps 'invalid login' do
  Then 'I should see login error' do
  ...
  end
end

Steps 'User provides wrong email' do
  include_steps 'login', 'jack', 'qwerty'
  include_steps 'invalid login'
end

Steps 'User provides wrong password' do
  include_steps 'login', 'jack@example.com', 'bla'
  include_steps 'invalid login'
end
```

### Pending steps

Simular to Example :pending behavior:

```ruby
Steps 'User login' do
  # just skip block
  When 'I go to login'

  # pass pending: true option
  Then 'I should see welcome', pending: true do
  ...
  end

  # pass pending: 'some pending message'
  Then 'I should see last login IP', pending: 'WIP' do
  ...
  end
end
```

## Authors

* [Andriy Yanko](http://ayanko.github.io)

## License

* Copyright (c) 2013 Railsware [www.railsware.com](http://www.railsware.com)
* [MIT](www.opensource.org/licenses/MIT)

## Alternatives

* [rspec-steps](https://github.com/LRDesign/rspec-steps)
* [rspec-given](https://github.com/jimweirich/rspec-given)
