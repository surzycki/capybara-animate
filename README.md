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

Capybara::Animate automatically hooks in to Cucumber Scenarios tagged with ```@javascript```. However, if your driver supports ```#save_screenshot```, you can create animations for scenarios tagged with ```@record```.

If you prefer to disable Capybara::Animate for some ```@javascript``` scenarios, tag them with ```@off-the-record```.

## Contributing

In development, Capybara::Animate depends on tesseract and capybara-webkit. On OS X, you can install tesseract with ```brew install tesseract```. Capybara-webkit depends on the X window system and Qt.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
  * Include test coverage.
  * Do not break existing tests.
  * Add documentation for new features.
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
