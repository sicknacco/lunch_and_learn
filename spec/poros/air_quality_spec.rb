# require 'rails_helper'

# RSpec.describe AirQuality do
#   it 'exists and has attributes' do
#     data = {
#       overall_aqi: 25,
#       'PM2.5': { concentration: 4.21 },
#       CO: { concentration: 433.92 }
#     }

#     country = 'Nigeria'
#     air_quality = AirQuality.new(data, country)

#     expect(air_quality).to be_an_instance_of(AirQuality)
#     expect(air_quality.country).to eq('Nigeria')
#     expect(air_quality.aqi).to eq(25)
#     expect(air_quality.pm25_concentration).to eq(4.21)
#     expect(air_quality.co_concentration).to eq(433.92)
#   end
# end