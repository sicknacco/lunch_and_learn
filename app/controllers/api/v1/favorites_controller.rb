class Api::V1::FavoritesController < ApplicationController

  def index
    @user = User.find_by(api_key: params[:api_key])
    if @user.nil?
      render json: { errors: "Invalid API Key" }, status: 401
    else
      render json: FavoriteSerializer.new(@user.favorites)
    end
    # require 'pry'; binding.pry
  end

  def create
    @user = User.find_by(api_key: params[:api_key])
    if @user.nil?
      render json: { errors: "Invalid API Key" }, status: 401
    else
      favorite = @user.favorites.new(favorite_params)
      favorite.save
      render json: { success: "Favorite added successfully" }, status: 201
    end
  end


  private
  def favorite_params 
    params.permit(:country, :recipe_link, :recipe_title)
  end
end