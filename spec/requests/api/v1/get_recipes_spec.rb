require 'rails_helper'

describe 'Recipe API' do
  it 'can get recipes for a chosen country', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    get('/api/v1/recipes?country=Thailand', headers: headers)

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(recipes).to be_a Hash
  end
end