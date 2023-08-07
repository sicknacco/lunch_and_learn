class AirQualityFacade
  def get_air_quality(country)
    response = AirQualityService.new.air_quality_data(country)
    AirQuality.new(response)
  end
end