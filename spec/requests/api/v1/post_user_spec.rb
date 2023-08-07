require 'rails_helper'

describe "Create User API" do
  describe "POST /api/v1/users" do
    it 'can create a new user' do
      user_params = {
        name: 'Bob',
        email: 'bob@website.com',
        password: 'password',
        password_confirmation: 'password'
      }

      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }
      
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
      
      expect(response).to be_successful

      user_data = JSON.parse(response.body, symbolize_names: true)

      expect(User.all.count).to eq(1)
    end
  end
end