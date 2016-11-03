require 'gifanime'

module Capybara
  module Animate
    class GifRecorder
      attr_reader :output_file

      def initialize(output_name)
        @output_file = "#{output_name}.gif"
        make_path_unless_exists(output_file)
        @gif_anime = Gifanime.new(output_file, delay: 40)
        @tmpdir = Dir.mktmpdir
      end

      def add(page)
        file = "#{tmpdir}/#{current_frame}.png"
        page.save_screenshot(file, width: 320, height: 480)
        gif_anime.add(file)
      end

      def generate!
        gif_anime.generate!
      end

      private
      attr_reader :tmpdir, :gif_anime

      def current_frame
        gif_anime.frames.length
      end

      def make_path_unless_exists(file)
        FileUtils.mkdir_p(File.dirname(file)) unless File.exists?(File.dirname(file))
      end
    end
  end
end
