require 'rails_helper'

RSpec.describe "Post Favorites API" do
  before(:each) do
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
        recipe_link: 'https://www.allrecipes.com/recipe/87872/sweet-chili-thai-sauce/'
      }
    end
  end
end