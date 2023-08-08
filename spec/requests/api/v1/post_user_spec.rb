require 'rails_helper'

RSpec.describe "Create User API" do
  describe "POST /api/v1/users" do
    it 'can create a new user' do
      payload = {      ### < -------aka user_params
        name: 'Bob',
        email: 'bob@website.com',
        password: 'password',
        password_confirmation: 'password'
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }
      
      post "/api/v1/users", headers: headers, params: JSON.generate(payload)
      
      expect(response).to be_successful
      expect(response.status).to eq(201)

      user_data = JSON.parse(response.body, symbolize_names: true)
      new_user = User.last

      expect(User.count).to eq(1)
      expect(user_data).to be_a Hash
      expect(user_data).to have_key(:data)
      expect(user_data[:data]).to be_a Hash

      expect(user_data[:data]).to have_key(:type)
      expect(user_data[:data][:type]).to eq('user')
      expect(user_data[:data]).to have_key(:id)
      expect(user_data[:data][:id]).to eq(new_user.id.to_s)
      expect(user_data[:data]).to have_key(:attributes)
      expect(user_data[:data][:attributes]).to be_a Hash

      expect(user_data[:data][:attributes]).to have_key(:name)
      expect(user_data[:data][:attributes][:name]).to eq(new_user.name)
      expect(user_data[:data][:attributes]).to have_key(:email)
      expect(user_data[:data][:attributes][:email]).to eq(new_user.email)

      expect(user_data[:data][:attributes]).to have_key(:api_key)
      expect(user_data[:data][:attributes][:api_key]).to eq(new_user.api_key)
    end

    it 'cannot create a new user if email is already taken' do
      User.create!(name: 'Bob', email: 'bob@bob.com', password: 'password', password_confirmation: 'password', api_key: '12345')
      payload = {
        name: 'Other Bob',
        email: 'bob@bob.com',
        password: 'password',
        password_confirmation: 'password'
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }

      post "/api/v1/users", headers: headers, params: JSON.generate(payload)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error_data = JSON.parse(response.body, symbolize_names: true)

      expect(error_data).to be_a Hash
      expect(error_data).to have_key(:errors)
      expect(error_data[:errors]).to eq('Email has already been taken')
    end

    it 'cannot create a new user if passwords do not match' do
      payload = {
        name: 'Tim',
        email: 'tim@tim.com',
        password: 'password',
        password_confirmation: 'password1'
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }

      post "/api/v1/users", headers: headers, params: JSON.generate(payload)

      expect(response).to_not be_successful

      expect(response.status).to eq(400)

      error_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(error_data).to be_a Hash
      expect(error_data).to have_key(:errors)
      expect(error_data[:errors]).to eq("Password confirmation doesn't match Password")
    end

    it 'cannot create a new user if name is missing' do
      payload = {
        name: '',
        email: 'tim@tim.com',
        password: 'password',
        password_confirmation: 'password'
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }
      post "/api/v1/users", headers: headers, params: JSON.generate(payload)

      expect(response).to_not be_successful

      expect(response.status).to eq(400)

      error_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(error_data).to be_a Hash
      expect(error_data).to have_key(:errors)
      expect(error_data[:errors]).to eq("Name can't be blank")
    end

    it 'cannot create a new user without an email' do
      payload = {
        name: 'Tim',
        email: '',
        password: 'password',
        password_confirmation: 'password'
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }
      post "/api/v1/users", headers: headers, params: JSON.generate(payload)

      expect(response).to_not be_successful

      expect(response.status).to eq(400)

      error_data = JSON.parse(response.body, symbolize_names: true)
      
      expect(error_data).to be_a Hash
      expect(error_data).to have_key(:errors)
      expect(error_data[:errors]).to eq("Email can't be blank")
    end
  end
end