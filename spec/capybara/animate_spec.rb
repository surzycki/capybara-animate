require 'spec_helper'

describe Capybara::Animate do
  class Dummy
    [
    :attach_file, :check, :choose, :click_link_or_button, :click_link,
    :fill_in, :unselect, :click_on, :execute_script, :evaluate_script,
    :visit, :go_back, :go_forward].each do |lazy|
      define_method lazy do |*args, &block|
        instance_variable_set("@#{lazy}", true)
      end

      define_method "#{lazy}?" do |*args, &block|
        !!instance_variable_get("@#{lazy}")
      end
    end
  end

  it 'should have a version number' do
    expect(Capybara::Animate::VERSION).to_not be_nil
  end

  context "included into a class" do
    let(:described_class) { Dummy.send(:include, Capybara::Animate) }

    context "the instance" do
      subject { described_class.new }

      it "should have an EmptyRecorder set to recorder" do
        expect(subject.recorder).to be_a(Capybara::Animate::EmptyRecorder)
      end

      it "should be able to set a recorder" do
        expect do
          subject.recorder = :foo
        end.to change { subject.recorder }
      end

      context "should add itself to the recorder" do
        [:attach_file, :check, :choose, :click_link_or_button, :click_link,
        :fill_in, :unselect, :click_on, :execute_script, :evaluate_script,
        :visit, :go_back, :go_forward].each do |attribute|
          it "for #{attribute}" do
            expect(subject.recorder).to receive(:add).with(subject)
            subject.send(attribute)
          end

          it "and still call the original #{attribute}" do
            expect do
              subject.send(attribute)
            end.to change { subject.send"#{attribute}?" }
          end
        end
      end
    end
  end
end
