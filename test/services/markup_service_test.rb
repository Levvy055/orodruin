require 'test_helper'

describe MarkupService do
  describe 'emojis' do
    let(:raw) { ':heart:' }
    subject(:text) { MarkupService.new(raw) }

    it 'include image tag' do
      subject.call.must_include 'img'
    end
  end
end
