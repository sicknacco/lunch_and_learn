require 'rails_helper'

RSpec.describe RecipeFacade, :vcr do
  describe '#get_recipe' do
    it 'returns an array of recipes' do
      country = 'Thailand'
      recipe = RecipeFacade.new.recipes(country)

      expect(recipe).to be_an Array
    end
  end
end