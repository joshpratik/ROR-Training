class PostsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    render json: Post.all
  end

  def show
    begin
      post =  Post.find(params[:id])
    rescue => error
      render json: {message: error.message}
    else
      render json: post
    end
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: {message: "Post added successfully"}
    else
      render json: {message: "Failed"}
    end
  end

  def update
    begin
      post =  Post.find(params[:id])
    rescue => error
      render json: {message: error.message}
    else
      if user.update(post_params)
        render json: {message: "User updated successfully"}
      else
        render json: {message: "User updation failed"}
      end
    end
  end

  def destroy
    if Post.destroy(params[:id])
      render json: {message: "Post deleted successfully"}
    else
      render json: {message: "Post deletion failed"}
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
