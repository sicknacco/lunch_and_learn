class AirQualitySerializer
  def format_air_quality(country)

    { data:
      {   id: nil,
          type: "air_quality",
          city: "Abuja",
          attributes: 
            { aqi: 27,
              pm25_concentration: 8.45,
              co_concentration: 547.41
            } 
      }
    }
  end
end