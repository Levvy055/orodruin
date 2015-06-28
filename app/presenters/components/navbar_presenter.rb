class Components::NavbarPresenter < Curly::Presenter
  def brand
    link_to('Orodruin', root_path, class: 'navbar-brand')
  end

  def blog_link
    link_to('Blog', blog_posts_path)
  end

  def user_menu
    render 'components/user_menu' if logged_in?
  end
end
