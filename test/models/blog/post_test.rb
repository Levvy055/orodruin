# == Schema Information
#
# Table name: blog_posts
#
#  id         :integer          not null, primary key
#  text_raw   :text
#  text       :text
#  title      :string
#  author_id  :integer          indexed
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_blog_posts_on_author_id  (author_id)
#

require 'test_helper'

describe Blog::Post do
  subject(:post) { Fabricate('Blog::Post') }

  it 'must set text on save' do
    subject.text_raw = '*text*'
    subject.save

    subject.text.must_equal "<p><em>text</em></p>\n"
  end
end
