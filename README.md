# FixtureDriver

Use Test Driven Development to Drive Your Test Driven Development!

Maintaining client side, html fixtures for unit testing your javascript is a pain! Use this to let your acceptance tests do the work.

## Installation

Add this line to your application's Gemfile:

    gem 'fixture_driver'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fixture_driver

## Usage

```ruby
  require 'fixture_driver/capybara'

  feature 'a request spec' do
    include FixtureDriver::Capybara
    scenario 'user visits homepage' do
      visit root_path
      save_fixture(Rails.root.join('spec/javascript/fixtures/root.html')
    end
  end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

