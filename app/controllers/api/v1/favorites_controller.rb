class Api::V1::FavoritesController < ApplicationController
  def create
    @user = User.find_by(api_key: params[:api_key])
    favorite = Favorite.new(favorite_params)
    # favorite = @user.favorites.new(favorite_params)
    require 'pry'; binding.pry
  end


  private
  def favorite_params 
    params.permit(:country, :recipe_link, :recipe_title)
  end
end