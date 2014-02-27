require 'capybara/animate/empty_recorder'

module Capybara
  module Animate
    VERSION = File.read(File.join(File.dirname(__FILE__),"..","..","VERSION")).freeze

    def self.included(base)
      base.send(:prepend,UserActions)
    end

    def recorder
      @recorder ||= EmptyRecorder.new
    end

    def recorder=(other)
      @recorder = other
    end

    USER_ACTIONS = [
      :attach_file,
      :check,
      :choose,
      :click_button,
      :click_link,
      :click_link_or_button,
      :click_on,
      :evaluate_script,
      :execute_script,
      :fill_in,
      :go_back,
      :go_forward,
      :unselect,
      :visit,
    ].freeze

    module UserActions
      USER_ACTIONS.each do |action_method|
        define_method action_method do |*args, &block|
          super(*args, &block)
          self.recorder.add(self)
        end
      end
    end
  end
end

require 'capybara/animate/gif_recorder'
require 'capybara/animate/hooks/cucumber' if defined?(Cucumber)
