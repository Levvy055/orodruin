class Blog::Post < ActiveRecord::Base
  audited

  belongs_to :author, class_name: 'User'
  has_many :assets, class_name: 'Blog::Asset'

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
#  title      :string
#  author_id  :integer          indexed
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_blog_posts_on_author_id  (author_id)
#
