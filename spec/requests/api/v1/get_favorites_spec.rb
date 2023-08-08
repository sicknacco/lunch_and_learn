require 'rails_helper'

RSpec.describe "Get Favorites API" do
  before(:each) do
    @user1 = User.create!(name: 'Bob',
                          email: 'bob@bob.com',
                          password: 'password',
                          password_confirmation: 'password',
                          api_key: '123456789')

    @user2 = User.create!(name: 'Tim',
                          email: 'tim@tim.com',
                          password: 'password',
                          password_confirmation: 'password',
                          api_key: '987654321')
    
    @favorite1 = Favorite.create!(user_id: @user1.id, country: 'Thailand',
                                  recipe_link: 'https://www.allrecipes.com/recipe/87872/sweet-chili-thai-sauce/',
                                  recipe_title: 'Sweet Chili Thai Sauce')

    @favorite2 = Favorite.create!(user_id: @user1.id, country: 'Mexico',
                                  recipe_link: 'https://www.allrecipes.com/grilled-chicken-street-tacos-recipe-7553311',
                                  recipe_title: 'Grilled Chicken Street Tacos')

    @favorite3 = Favorite.create!(user_id: @user1.id, country: 'Italy',
                                  recipe_link: 'https://www.allrecipes.com/baked-italian-sub-recipe-7570313',
                                  recipe_title: 'Baked Italian Sub')
  end

  describe 'GET /api/v1/favorites' do
    it 'can get all favorites for a user', :vcr do
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }

      get "/api/v1/favorites?api_key=123456789", headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(200)

      favorites = JSON.parse(response.body, symbolize_names: true)

      expect(favorites).to be_a Hash
      expect(favorites).to have_key(:data)
      expect(favorites[:data]).to be_an Array
      expect(favorites[:data].size).to eq(3)

      favorites[:data].each do |favorite|
        expect(favorite).to have_key(:id)
        expect(favorite).to have_key(:type)
        expect(favorite).to have_key(:attributes)
        
        expect(favorite[:attributes]).to have_key(:recipe_title)
        expect(favorite[:attributes]).to have_key(:recipe_link)
        expect(favorite[:attributes]).to have_key(:country)
        expect(favorite[:attributes]).to have_key(:created_at)
        expect(favorite[:attributes].size).to eq(4)
      end
    end
  end
end