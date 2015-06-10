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

class Blog::PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :created_at, :updated_at

  has_one :author
  has_many :assets
end
