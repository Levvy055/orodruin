class BlogAPI < Grape::API
  prefix 'blog'

  get :posts do
    present Blog::Post.all
  end
end
