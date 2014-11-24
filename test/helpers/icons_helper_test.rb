require 'test_helper'

describe IconsHelper do
  include ActionView::Helpers::AssetTagHelper
  include IconsHelper

  describe '#icon' do
    it 'set class to given string' do
      icon(:test).must_have_attr 'icon-test', 'class'
    end

    it 'substitute underscore with dashes' do
      # assert_attr_equal 'icon-test-under', icon(:test_under), 'class'
      icon(:test_under).must_have_attr 'icon-test-under', 'class'
    end
  end

  describe '#menu_icon' do
    it '#menu_icon' do
      menu_icon.must_equal_dom(([icon('bar')] * 3).join(''))
    end
  end
end
