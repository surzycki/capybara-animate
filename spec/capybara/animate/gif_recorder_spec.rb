require 'spec_helper'

require 'capybara/animate/gif_recorder'

describe Capybara::Animate::GifRecorder, type: :recorder do
  let(:gif_anime) { double(add: true, frames: [], generate!: true) }
  before do
    allow(Gifanime).to receive(:new).and_return(gif_anime)
  end

  let(:tmpdir) { FileUtils.mkdir_p(Dir.pwd+"/tmp").first }
  before do
    allow(Dir).to receive(:mktmpdir).and_return(tmpdir)
  end

  let(:output_name) { "the file name" }

  let(:recorder) { described_class.new(output_name) }

  subject { recorder }

  it "should create the output path if it does not yet exist" do
    unique_path = Dir.pwd+"/tmp/#{SecureRandom::uuid}/foobar"
    expect do
      described_class.new(unique_path)
    end.to change { File.exists?(File.dirname(unique_path))}
  end

  it "sets the output_file based on initialization values" do
    expect(subject.output_file).to eql("#{output_name}.gif")
  end

  describe "#add" do
    let(:page) { double(save_screenshot: true) }

    let(:adding) { proc { recorder.add(page) } }
    subject { adding.call }

    it "should save a screenshot from the page to a file in a temp directory" do
      expect(page).to receive(:save_screenshot).with("#{tmpdir}/0.png", hash_including(:width, :height))
      subject
    end

    it "should add the saved screenshot to the Gifanime" do
      expect(gif_anime).to receive(:add).with("#{tmpdir}/0.png")
      subject
    end
  end

  describe "#generate!" do
    let(:generating) { proc { recorder.generate! } }
    subject { generating.call }

    it "should generate with the Gifanime" do
      expect(gif_anime).to receive(:generate!)
      subject
    end
  end
end
