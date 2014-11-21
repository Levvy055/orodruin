class Blog::Posts::ShowPresenter < Curly::Presenter
  presents :post

  def post
    render partial: @post
  end
end
