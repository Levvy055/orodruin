class Blog::Posts::ShowPresenter < Curly::Presenter
  presents :post

  def setup!
    content_for :title, @post.title
  end

  def post
    render partial: @post
  end
end
