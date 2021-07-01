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
