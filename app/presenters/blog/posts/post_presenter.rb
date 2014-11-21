class Blog::Posts::PostPresenter < Curly::Presenter
  presents :post

  def title
    link_to(@post.title, @post)
  end

  def author_name(nickname: false)
    author.name(nickname)
  end

  def text
    @post.text.html_safe
  end

  def cache_key
    [@post]
  end

  private

  def author
    @post.author.decorate
  end
end
