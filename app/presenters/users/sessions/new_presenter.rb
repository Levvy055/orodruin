class Users::Sessions::NewPresenter < Curly::Presenter
  def login_form
    render 'login_form'
  end
end
