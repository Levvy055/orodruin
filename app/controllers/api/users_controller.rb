class Api::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def me
    render json: current_user
  end

  def show
    render json: User.find(params[:id])
  end
end
