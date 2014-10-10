require 'test_helper'

describe EmojisHelper do
  include ActionView::Helpers::AssetTagHelper
  include EmojisHelper

  let(:index) { Emoji::Index.new }
  let(:emoji) { index.find_by_name('heart') }

  subject { emoji_tag(emoji) }

  it 'has valid src' do
    assert_attr_equal '//www.tortue.me/emoji/heart.png', subject, :src
  end

  it 'belongs to .emoji class' do
    assert_attr_equal 'emoji', subject, 'class'
  end

  it 'is 20x20 square' do
    assert_attr_equal '20', subject, 'width'
    assert_attr_equal '20', subject, 'height'
  end

  it 'has fallback to UTF-8 emoji' do
    assert_attr_equal emoji['moji'], subject, 'alt'
  end
end
