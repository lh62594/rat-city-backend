class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all.sort_by{|user| user.score}.reverse[0..9]
    render json: @users
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :score)
  end

end
