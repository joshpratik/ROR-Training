class MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: User.all
  end

  def current_user
    render json: current_user
  end
end
