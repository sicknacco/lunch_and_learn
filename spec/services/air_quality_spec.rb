require 'rails_helper'

RSpec.describe AirQualityService do
  it 'can retrieve air quality data for a capital city', :vcr do
    air_quality = AirQualityService.new.air_quality_data('Nigeria')

    expect(air_quality).to be_a Hash
    expect(air_quality).to have_key :overall_aqi
    expect(air_quality).to have_key :"PM2.5"
    expect(air_quality[:"PM2.5"]).to have_key :concentration
    expect(air_quality).to have_key :CO
    expect(air_quality[:CO]).to have_key :concentration
  end
end