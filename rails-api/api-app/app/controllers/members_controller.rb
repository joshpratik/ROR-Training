# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :set_member, only: %i[show destroy update]

  def index
    render json: User.all
    #@user = User.all
  end

  def update
    #debugger
    if @member.update(member_params)
      render json: "user updated", status: :ok
    else
      render json: { errors: @member.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    #debugger
    @member.destroy
  end

  def show
    render json: @member, status: :ok
  end

  private

  def member_params
    params.require(:user).permit(:email, :name, :age, :bio, :password)
  end

  def set_member
    @member = User.find(params[:id])
  end
end
