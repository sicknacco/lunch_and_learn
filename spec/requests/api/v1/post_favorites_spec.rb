require 'rails_helper'

RSpec.describe "Post Favorites API" do
  before(:each) do
    @user = User.create!(name: 'Bob',
                        email: 'bob@bob.com',
                        password: 'password', 
                        password_confirmation: 'password',
                        api_key: '123456789')
  end

  describe 'POST /api/v1/favorites' do
    it 'can add a favorite for a user', :vcr do
      payload = {
        api_key: @user.api_key,
        country: 'Thailand',
        recipe_link: 'https://www.allrecipes.com/recipe/87872/sweet-chili-thai-sauce/',
        recipe_title: 'Sweet Chili Thai Sauce'
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }

      post "/api/v1/favorites", headers: headers, params: JSON.generate(payload)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      favorite_data = JSON.parse(response.body, symbolize_names: true)

      expect(Favorite.count).to eq(1)
      expect(favorite_data).to be_a Hash
    end
  end
end