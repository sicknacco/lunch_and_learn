require 'rails_helper'

RSpec.describe AirQuality do
  it 'exists and has attributes' do
    data = {
      overall_aqi: 25,
      'PM2.5': { concentration: 4.21 },
      CO: { concentration: 433.92 }
    }
  end
end