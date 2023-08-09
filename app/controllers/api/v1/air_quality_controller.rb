class Api::V1::AirQualityController < ApplicationController
  def index
    capital = CountryFacade.new.get_capital(params[:country])
    air_data = AirQualityService.new.air_quality_data(capital)
    render json: AirQualitySerializer.new.format_air_quality(air_data, capital) ##<< -- being passed to the serializer
  end
end