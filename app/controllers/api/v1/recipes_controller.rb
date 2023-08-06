class Api::V1::RecipesController < ApplicationController
  def index
    country = CountryFacade.get_country(params[:country])
    recipes = RecipeFacade.new.recipes(country)
    render json: RecipeSerializer.new(recipes)
  end
end