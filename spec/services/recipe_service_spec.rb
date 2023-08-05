require 'rails_helper'

RSpec.describe RecipeService do
  it 'can create a connection, and consume the api', :vcr do
    recipe = RecipeService.new.get_recipe('Thailand')
    
    expect(recipe).to be_an Hash
    expect(recipe).to have_key :hits
    expect(recipe[:hits]).to be_an Array
    expect(recipe[:hits][0]).to have_key :recipe
    expect(recipe[:hits][0][:recipe]).to have_key :label
    expect(recipe[:hits][0][:recipe][:label]).to be_a String  # < Title of recipe
    expect(recipe[:hits][0][:recipe][:image]).to be_a String  # < Image of recipe
    expect(recipe[:hits][0][:recipe][:url]).to be_a String  # < Url of recipe
  end
end