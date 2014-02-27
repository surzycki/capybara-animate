if defined?(Capybara::Session)
  Capybara::Session.send(:include, Capybara::Animate)
  Before("@javascript") do |scenario|
    page.recorder = Capybara::Animate::GifRecorder.new("html-report/"+scenario.name)
  end

  After do |scenario|
    page.recorder.add(page)
    page.recorder.generate!
  end
end
