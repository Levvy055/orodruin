class Blog::Posts::IndexPresenter < Curly::Presenter
  presents :posts

  def posts
    render partial: 'post', collection: @posts
  end
end
