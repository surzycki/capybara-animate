Capybara::Animate
=

Take a peak at your headless browser acceptance tests. Capybara::Animate captures screenshots after Capybara driven user actions in order to compose an animation of your scenario.

## Installation

Capybara::Animate depends on ImageMagick, on OS X installation is simple: ```brew install imagemagick```

Add this line to your application's Gemfile:

    gem 'capybara-animate', group: :test

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-animate

## Usage

Capybara::Animate automatically hooks in to Cucumber Scenarios tagged with ```@javascript```. It depends on a driver that implements ```#save_screenshot```

## Credit

This is entirely based off of the work of [Shimpei Makimoto's RubyConf 2013 Lightning Talk](https://github.com/makimoto/feature_spec_with_animation/). Simply: my contributions are to make it a gem that plugs into Cucumber scenarios automatically.

## Contributing

In development, Capybara::Animate depends on capybara-webkit. Capybara-webkit depends on the X window system and Qt, see [capybara-webkit's README for instructions on how to setup its dependencies](https://github.com/thoughtbot/capybara-webkit/)

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
  * Include test coverage.
  * Do not break existing tests.
  * Add documentation for new features.
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
