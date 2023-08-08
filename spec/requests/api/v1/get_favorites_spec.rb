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

  end
end