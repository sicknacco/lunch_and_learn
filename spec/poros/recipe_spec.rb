require 'rails_helper'

RSpec.describe Recipe do
  it 'exists and has attributes' do
    data = {
      recipe: {
        label: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
        url: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
        image: 'https://edamam-product-images.s3.amazonaws.com/food-img/3c1/3c1c1d6b1e1e1f4e4b0b4b4b4b4b4b4b.jpg'
      }
    }
    country = 'Thailand'
    recipe = Recipe.new(data, country)

    expect(recipe).to be_an_instance_of(Recipe)
    expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipe.url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/food-img/3c1/3c1c1d6b1e1e1f4e4b0b4b4b4b4b4b4b.jpg")
    expect(recipe.country).to eq('Thailand')
  end
end