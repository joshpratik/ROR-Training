class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @users = User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      #NewUserEmailMailer.notify_user(user).deliver
      redirect_to '/signup'
      flash[:success] = "Success"
    else
      redirect_to '/signup'
      flash[:danger] = "error"
    end
  end

  def destroy
    if User.destroy(params[:id])
      redirect_to '/'
      flash[:success] = "User Deleted Successfully"
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = "User Deletion Failed"
    end
  end

  def show
    begin
      @user =  User.find(params[:id])
    rescue => error
      flash[:danger] = error.message
    else
      @user
    end
  end

  def update
    begin
      user =  User.find(params[:id])
    rescue => error
      flash[:danger] = "User Not Found"
    else
      if user.update(user_params)
        redirect_to "/users/#{user.id}"
        flash[:success] = "User Updated"
      else
        redirect_to "/users/#{user.id}"
        flash[:success] = "User Not Updated"
      end
    end
  end

  def new 
  end

  def edit
    begin
      @user =  User.find(params[:id])
    rescue => error
      redirect_back(fallback_location: root_path)
      flash[:danger] = "Post Not Found"
    else
      @user
    end
  end

  private

    def user_params
      params.permit(:name, :email, :bio, :age, :password_digest)
    end
end
