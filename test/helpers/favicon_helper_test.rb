require 'test_helper'

describe FaviconHelper do
  include ActionView::Helpers
  include FaviconHelper

  describe 'apple_touch_favicon' do
    subject { apple_touch_favicon }

    it 'has rel attribute set to "apple-touch-icon"' do
      assert_attr_equal 'apple-touch-icon', subject, 'rel'
    end

    it 'has href set to "apple-touch-icon.png"' do
      assert_attr_equal '/apple-touch-icon.png', subject, 'href'
    end

    describe 'with custom size' do
      subject { apple_touch_favicon size: 20 }

      it 'has href set to "apple-touch-icon-20x20.png"' do
        assert_attr_equal '/apple-touch-icon-20x20.png', subject, 'href'
      end

      it 'has sizes attr set to 20' do
        assert_attr_equal '20x20', subject, 'sizes'
      end
    end
  end
end
