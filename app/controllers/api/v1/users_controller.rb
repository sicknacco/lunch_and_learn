class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.generate_api_key # < -------- this method is in the User model
    if @user.save
      render json: UserSerializer.new(@user), status: 201
    else
      render json: { errors: @user.errors.full_messages.to_sentence }, status: 400
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password)
  end
end