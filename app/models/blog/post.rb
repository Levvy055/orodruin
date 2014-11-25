class Blog::Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  before_save :parse_text

  protected

  attr_writer :text

  def parse_text
    parser = MarkupService.new(text_raw)

    self[:text] = parser.call
  end
end

# == Schema Information
#
# Table name: blog_posts
#
#  id         :integer          not null, primary key
#  text_raw   :text
#  text       :text
#  title      :string(255)
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_blog_posts_on_author_id  (author_id)
#
