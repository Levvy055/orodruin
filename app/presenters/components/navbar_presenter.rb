class Components::NavbarPresenter < Curly::Presenter
  def brand
    link_to('Orodruin', root_path, class: 'navbar-brand')
  end

  def blog_item
    content_tag(:li, link_to('Blog', blog_posts_path))
  end
end
