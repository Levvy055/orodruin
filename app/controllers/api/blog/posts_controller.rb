class Api::Blog::PostsController < API::ApplicationController
  def index
    render json: model.all
  end

  def show
    render json: model.find(params[:id])
  end

  private

  def model
    ::Blog::Post.includes(:author, :assets)
  end
end
