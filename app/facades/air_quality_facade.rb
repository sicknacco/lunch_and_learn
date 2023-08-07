class AirQualityFacade
  def get_air_quality(country)
    response = AirQualityService.new.air_quality_data(country) #< air_quality_data is a method in AirQualityService
    AirQuality.new(response)
  end
end