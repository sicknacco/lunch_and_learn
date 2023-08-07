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

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

      expect(response).to be_successful

      created_user = JSON.parse(response.body, symbolize_names: true)
    end
  end
end