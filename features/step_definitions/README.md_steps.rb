require 'rmagick'

THE_ANIMATED_GIF = Transform(/the animated gif "(.*?)"/) do |filename|
  in_current_dir do
    Magick::ImageList.new(filename)
  end
end

Then(/^(#{THE_ANIMATED_GIF}) should have (\d+) frames$/) do |animated_gif, expected_frames|
  expect(animated_gif.length).to eql(expected_frames.to_i)
end
