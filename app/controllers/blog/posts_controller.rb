class Blog::PostsController < ApplicationController
  def index
    @posts = Blog::Post.all.includes(:author)
  end

  def show
    @post = Blog::Post.find(params[:id])
  end
end
