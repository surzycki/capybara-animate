@disable-bundler
Feature: README.md statements of public interface
  In order to see whats going on in headless browser interaction scenarios
  As a developer
  I expect scenarios tagged with @javascript or @record to be captured as gif animations

  Background:
    Given a file named "Gemfile" with:
    """
    gem "cucumber"
    gem "capybara-webkit"
    gem "rspec-expectations"
    gem "capybara-animate", path: "../../"
    """
    And a file named "features/support/env.rb" with:
    """
    require 'capybara/cucumber'
    require 'capybara/webkit'
    require 'capybara/animate'
    require 'rspec/expectations'
    Capybara.javascript_driver = :webkit
    """
    And I run `bundle install`

  Scenario: Running a scenario tagged with @javascript
    Given a file named "features/capybara-webkit-javascript.feature" with:
    """
    Feature: Search for Ruby gems with !rubygems
      As a Ruby developer
      In order to quickly find fancy gems
      The '!rubygems <gemname>` query should take me directly to fancy gems

      @javascript
      Scenario: Finding the Capybara gem
        Given I am on the DDG homepage
        When I search for "!rubygems capybara"
        Then I should see an exact match on the Ruby Gems search page
    """
    And a file named "features/step_definitions/capybara-webkit-javascript_steps.rb" with:
    """
    Given /^I am on the DDG homepage$/ do
      visit 'http://duckduckgo.com'
    end

    When /^I search for "([^"]*)"$/ do |query|
      @query = query
      fill_in 'q', :with => query
      click_button "search_button_homepage"
    end

    Then /^I should see an exact match on the Ruby Gems search page$/ do
      gem_name = @query.split(' ').last
      page.should have_selector("a[href='/gems/#{gem_name}']")
    end
    """
    When I successfully run `bundle exec cucumber` for up to 24 seconds
    Then the output should contain "1 scenario (1 passed)"
    And a file named "html-report/Finding the Capybara gem.gif" should exist
