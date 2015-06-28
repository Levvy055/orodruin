class Components::UserMenuPresenter < Curly::Presenter
  def signout_link
    link_to 'Sign out', signout_path, method: :delete
  end
end
