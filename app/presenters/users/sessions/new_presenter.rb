class Users::Sessions::NewPresenter < Curly::Presenter
  def signin_form
    render 'signin_form'
  end
end
