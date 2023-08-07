require 'rails_helper'

describe 'Air Quality API' do
  it 'can retrieve air quality data for a capital city', :vcr do
    country = 'Nigeria'

    get "/api/v1/air_quality?country=#{country}"

    expect(response).to be_successful

    air_quality = JSON.parse(response.body, symbolize_names: true)

    expect(air_quality).to be_a Hash
  end
end