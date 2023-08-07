require 'rails_helper'

RSpec.describe AirQualityService do
  it 'can create a connection, and get air quality data', :vcr do
    air_quality = AirQualityService.new.air_quality_data('Nigeria')

    expect(air_quality).to be_an Array
    air_quality.each do |data|
      expect(data).to have_key :name
      expect(data[:name]).to have_key :common # < :common = Country Name
      expect()
    end
  end
end