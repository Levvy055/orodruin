require 'test_helper'

describe MarkupService do
  describe 'emojis' do
    let(:emoji) { Emoji::Index.new.find_by_name('heart') }
    subject(:text) { MarkupService.new(raw).call }

    describe 'string emoji' do
      let(:raw) { ':heart:' }

      it 'include image tag' do
        subject.must_include 'img'
      end

      describe 'if emoji doesn\'t exist' do
        let(:raw) { ':non_existing:' }

        it 'must be left intact' do
          subject.must_include raw
        end
      end
    end

    describe 'unicode emoji' do
      let(:raw) { "\u2764" }

      it 'include image tag' do
        subject.must_include 'img'
      end
    end
  end

  describe 'markdown' do
    pending 'check for proper paragraphs'
    pending 'check for proper headers'
  end
end
