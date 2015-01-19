class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:show]
  before_action :authentiacate_with_token!, only: [:update, :destory]
  respond_to :json

  def show
    respond_with @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def update
    user = current_user
    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def destroy
    current_user.destroy
    head 204
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def get_user
     @user = User.find(params[:id])
    end
end
