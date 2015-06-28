class UserMailer::ActivationNeededEmailPresenter < Curly::Presenter
  presents :user

  def activation_url
    activation_user_path(id: @user.activation_token)
  end

  def activation_link
    link_to 'Activate your account', activation_url
  end
end
