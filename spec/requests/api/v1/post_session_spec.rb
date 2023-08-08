require 'rails_helper'

RSpec.describe "Create Sessions API" do
  before(:each) do
    User.create!(name: 'Bob', email: 'bob@bob.com', password: 'password', password_confirmation: 'password', api_key: '123456789')
  end

  describe 'POST /api/v1/sessions' do
    it 'can create a new session' do
      payload = {
        email: 'bob@bob.com',
        password: 'password'
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }
      post "/api/v1/sessions", headers: headers, params: JSON.generate(payload)

      expect(response).to be_successful

      session_data = JSON.parse(response.body, symbolize_names: true)
      
    end
  end
end