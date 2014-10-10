require 'test_helper'

describe EmojisHelper do
  include ActionView::Helpers::AssetTagHelper
  include EmojisHelper

  let(:index) { Emoji::Index.new }
  let(:emoji) { index.find_by_name('heart') }

  it 'has valid src' do
    assert_attr_equal '//www.tortue.me/emoji/heart.png', emoji_tag(emoji), 'src'
  end
end
