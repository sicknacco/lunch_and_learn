require 'rails_helper'

describe 'Air Quality API' do
  it 'can retrieve air quality data for a capital city', :vcr do
    country = 'Nigeria'

    get "/api/v1/air_quality?country=#{country}"

    expect(response).to be_successful

    air_quality = JSON.parse(response.body, symbolize_names: true)

    expect(air_quality).to be_a Hash
    expect(air_quality).to have_key :data
    expect(air_quality[:data]).to be_a Hash

    expect(air_quality[:data]).to have_key :id
    expect(air_quality[:data][:id]).to eq(nil)
    expect(air_quality[:data]).to have_key :type
    expect(air_quality[:data][:type]).to eq("air_quality")
    expect(air_quality[:data]).to have_key :city
    expect(air_quality[:data][:city]).to eq("Abuja")
    expect(air_quality[:data]).to have_key :attributes
    expect(air_quality[:data][:attributes]).to be_a Hash

    expect(air_quality[:data][:attributes]).to have_key :aqi
    expect(air_quality[:data][:attributes]).to have_key :pm25_concentration
    expect(air_quality[:data][:attributes]).to have_key :co_concentration
  end
end