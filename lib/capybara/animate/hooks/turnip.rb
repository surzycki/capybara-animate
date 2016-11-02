if defined?(Capybara::Session)
  RSpec.configure do |config|
    config.include Capybara::Animate

    config.before(type: :feature) do
      filename    = RSpec.current_example.metadata[:example_group][:full_description].downcase.gsub(/ /, '_')
      @__recorder = Capybara::Animate::GifRecorder.new("public/turnip/#{filename}")
    end

    config.after(type: :feature) do
      @__recorder.add(page)
      @__recorder.generate!
    end
  end
end
