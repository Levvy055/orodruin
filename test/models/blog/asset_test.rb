# == Schema Information
#
# Table name: blog_assets
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string           default("")
#  asset       :string
#  post_id     :integer          indexed
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_blog_assets_on_post_id  (post_id)
#

require 'test_helper'

describe Blog::Asset do
  let(:asset) { Blog::Asset.new }

  it 'must be valid' do
    value(asset).must_be :valid?
  end
end
