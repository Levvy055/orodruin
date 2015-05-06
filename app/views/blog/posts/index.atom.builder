atom_feed do |feed|
  feed.title 'Orodruin blog'
  feed.updated @posts.maximum(:updated_at)

  @posts.each do |post|
    feed.entry post do |entry|
      entry.title post.title
      entry.summary post.text
      entry.url blog_post_path(post)
      entry.author do |author|
        author.name post.author.decorate.name
        author.email post.author.email
      end
    end
  end
end
