class PostsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @posts = Post.all
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
      redirect_to "/users/#{params[:user_id]}"
      flash[:success] = "Post Added Successfully"
    else
      redirect_to "/addpost/#{params[:user_id]}"
      flash[:danger] = "Post Not Added"
    end
  end

  def update
    begin
      post =  Post.find(params[:id])
    rescue => error
      flash[:danger] = "Post Not Found"
    else
      if post.update(post_params)
        redirect_to "/users/#{post.user_id}"
        flash[:success] = "Post Updated"
      else
        redirect_to "/users/#{post.user_id}"
        flash[:success] = "Post Not Updated"
      end
    end
  end

  def destroy
    if Post.destroy(params[:id])
      redirect_back(fallback_location: root_path)
      flash[:success] = "Post Deleted Successfully"
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = "Post Deletion Failed"
    end
  end

  def new
  end

  def edit
    begin
      @post =  Post.find(params[:id])
    rescue => error
      redirect_back(fallback_location: root_path)
      flash[:danger] = "Post Not Found"
    else
      @post
    end
  end

  private
    def post_params
      params.permit(:title, :body, :user_id)
    end
end