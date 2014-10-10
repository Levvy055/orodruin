require 'test_helper'

describe MarkupService do
  describe 'emojis' do
    let(:raw) { ':heart:' }
    let(:emoji) { Emoji::Index.new.find_by_name('heart') }
    subject(:text) { MarkupService.new(raw) }

    it 'include image tag' do
      subject.call.must_include 'img'
    end

    describe 'if emoji doesn\'t exist' do
      let(:raw) { ':non_existing:' }

      it 'must be left intact' do
        subject.call.must_include raw
      end
    end
  end
end
