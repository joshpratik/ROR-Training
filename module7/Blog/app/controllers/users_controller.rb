class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {message: "User ragistered successfully"}
    else
      render json: {message: "User registration failed"}
    end
  end

  def destroy
    if User.destroy(params[:id])
      render json: {message: "User deleted successfully"}
    else
      render json: {message: "User deletion failed"}
    end
  end

  def show
    begin
      user =  User.find(params[:id])
    rescue => error
      render json: {message: error.message}
    else
      render json: user
    end
  end

  def update
    begin
      user =  User.find(params[:id])
    rescue => error
      render json: {message: error.message}
    else
      if user.update(user_params)
        render json: {message: "User updated successfully"}
      else
        render json: {message: "User updation failed"}
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :bio, :age)
    end
end
