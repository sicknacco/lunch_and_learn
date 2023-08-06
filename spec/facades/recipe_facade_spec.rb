require 'rails_helper'

RSpec.describe RecipeFacade, :vcr do
  describe '#get_recipe' do
    it 'returns an array of recipes' do
      country = 'Thailand'
      recipes = RecipeFacade.new.recipes(country)
      expect(recipes).to be_an Array
    end

    it 'returns all of the correct attributes' do
      country = 'Thailand'
      recipes = RecipeFacade.new.recipes(country)
      
      expect(recipes).to all(be_a(Recipe))
      expect(recipes[0].country).to eq('Thailand')
      expect(recipes[0].id).to eq('null')
      expect(recipes[0].image).to be_a(String)
      expect(recipes[0].title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipes[0].url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    end
    
    it 'returns an empty array if no recipes are found' do
      country = 'bigfootville'
      recipes = RecipeFacade.new.recipes(country)
      expect(recipes).to eq([])
    end
  end
end