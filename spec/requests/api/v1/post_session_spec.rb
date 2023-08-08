require 'rails_helper'

RSpec.describe "Create Sessions API" do
  before(:each) do
    @user = User.create!(name: 'Bob',
                        email: 'bob@bob.com',
                        password: 'password', 
                        password_confirmation: 'password',
                        api_key: '123456789')
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

      expect(session_data).to be_a Hash
      expect(session_data).to have_key(:data)
      expect(session_data[:data]).to be_a Hash

      expect(session_data[:data]).to have_key(:type)
      expect(session_data[:data][:type]).to eq('user')
      expect(session_data[:data]).to have_key(:id)
      expect(session_data[:data][:id]).to be_a String
      expect(session_data[:data][:id]).to eq(@user.id.to_s)
      expect(session_data[:data]).to have_key(:attributes)

      expect(session_data[:data][:attributes]).to have_key(:name)
      expect(session_data[:data][:attributes][:name]).to eq(@user.name)
      expect(session_data[:data][:attributes]).to have_key(:email)
      expect(session_data[:data][:attributes][:email]).to eq(@user.email)
      expect(session_data[:data][:attributes]).to have_key(:api_key)
      expect(session_data[:data][:attributes][:api_key]).to eq(@user.api_key)

      expect(session_data[:data][:attributes]).to_not have_key(:password)
      expect(session_data[:data][:attributes].keys.size).to eq(3)
    end
  end
end