class Users::SessionsController < ApplicationController
  def new
    redirect_back_or_to root_url, notice: 'Already signed in' if current_user
  end

  def create
    user = login(params[:name], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password was invalid!'
      render :new
    end
  end

  def destroy
    if logout
      redirect_to root_path, notice: 'Successfuly logged out'
    else
      redirect_back_or_to root_url, alert: 'Something gone wrong'
    end
  end
end
