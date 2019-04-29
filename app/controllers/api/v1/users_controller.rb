class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all.sort_by{|user| user.score}.reverse
    render json: @users
  end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.permit(:username, :score)
  end

end
