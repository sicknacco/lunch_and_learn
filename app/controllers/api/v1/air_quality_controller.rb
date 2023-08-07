class Api::V1::AirQualityController < ApplicationController
  def index
    render json: AirQualitySerializer.new.format_air_quality(params[:country])
  end
end