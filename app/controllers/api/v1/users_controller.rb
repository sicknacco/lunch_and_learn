class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, password: :password_confirmation)
  end
end