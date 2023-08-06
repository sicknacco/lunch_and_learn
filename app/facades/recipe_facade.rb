class RecipeFacade
  def recipes(country)
    recipes = RecipeService.new.get_recipes(country) #< get_recipes is a method in RecipeService
    recipes[:hits].map do |recipe|
      Recipe.new(recipe, country)
    end
  end
end