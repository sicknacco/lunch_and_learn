class AirQualitySerializer
  def format_air_quality(air_data, capital)  ##<< --- air_data and capital are from the controller
    { data:
      {   id: nil,
          type: "air_quality",
          city: capital,
          attributes: 
            { aqi: air_data[:overall_aqi],
              pm25_concentration: air_data[:"PM2.5"][:concentration],
              co_concentration: air_data[:CO][:concentration]
            } 
      }
    }
  end
end