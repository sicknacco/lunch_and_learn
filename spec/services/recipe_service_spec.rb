require 'rails_helper'

RSpec.describe RecipeService do
  it 'can create a connection, and consume the api', :vcr do
    recipes = RecipeService.new.get_recipes('Thailand')
    
    expect(recipes).to be_an Hash
    expect(recipes).to have_key :hits
    expect(recipes[:hits]).to be_an Array
    expect(recipes[:hits][0]).to have_key :recipe
    expect(recipes[:hits][0][:recipe]).to have_key :label
    expect(recipes[:hits][0][:recipe][:label]).to be_a String  # < Title of recipe
    expect(recipes[:hits][0][:recipe][:image]).to be_a String  # < Image of recipe
    expect(recipes[:hits][0][:recipe][:url]).to be_a String  # < Url of recipe
  end
end