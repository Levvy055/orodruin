require 'test_helper'

describe FaviconHelper do
  include ActionView::Helpers
  include FaviconHelper

  describe 'favicon' do
    subject { favicon }

    it 'has rel attribute set to "icon"' do
      assert_attr_equal 'icon', subject, 'rel'
    end

    it 'has href set to "favicon.png"' do
      assert_attr_equal '/favicon.png', subject, 'href'
    end

    describe 'with custom size' do
      subject { favicon size: 20 }

      it 'has href set to "favicon-20x20.png"' do
        assert_attr_equal '/favicon-20x20.png', subject, 'href'
      end

      it 'has sizes attr set to 20' do
        assert_attr_equal '20x20', subject, 'sizes'
      end
    end

    describe 'with custom `rel` attribute' do
      let(:rel) { 'lol' }
      subject { favicon rel: rel }

      it 'has set `rel` attribute to given value' do
        assert_attr_equal rel, subject, 'rel'
      end
    end
  end

  describe 'favicons' do
    let(:sizes) { [10, 20, 30] }
    subject { favicons sizes: sizes }

    it 'include each favicon size' do
      sizes.each do |size|
        subject.must_include favicon(size: size)
      end
    end
  end

  describe 'apple_touch_icons' do
    let(:sizes) { [10, 20, 30] }
    subject { apple_touch_icons sizes: sizes }

    it 'uses apple-touch-icon as `rel`' do
      assert_attr_equal 'apple-touch-icon', subject, 'rel'
    end

    it 'include each favicon size' do
      sizes.each do |size|
        subject.must_include favicon(size: size,
                                     base: 'apple-touch-icon',
                                     rel: 'apple-touch-icon')
      end
    end
  end

  describe 'windows_tile' do
    let(:image) { '/foo.png' }
    let(:color) { '#fff' }
    subject(:tile) { windows_tile image: image, color: color }

    it 'describe tile color' do
      subject.must_include "content=\"#{color}\""
    end

    it 'describe tile image' do
      subject.must_include "content=\"#{image}\""
    end
  end
end
