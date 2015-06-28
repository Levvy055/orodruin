class UsersController < ApplicationController
  def activate
    @user = User.load_from_activation_token(params[:id])
    @user.activate!
  end
end
