require 'rails_helper'

RSpec.describe AirQualityFacade, :vcr do
  describe '#get_air_quality' do
    it "returns air quality data for a capital city" do
      country = 'Nigeria'
      air_quality = AirQualityFacade.new.get_air_quality(country)

      expect(air_quality).to be_an_instance_of(AirQuality)
      expect(air_quality).to be_a Hash
      expect(air_quality).to have_key :overall_aqi
      expect(air_quality).to have_key :"PM2.5"
      expect(air_quality[:"PM2.5"]).to have_key :concentration
      expect(air_quality).to have_key :CO
      expect(air_quality[:CO]).to have_key :concentration
    end
  end
end