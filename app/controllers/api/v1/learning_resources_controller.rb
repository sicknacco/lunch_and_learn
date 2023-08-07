class Api::V1::LearningResourcesController < ApplicationController
  def index
    video = VideoFacade.new.video(params[:country])
    images = ImageFacade.new.country_images(params[:country])
    render json: LearningResourceSerializer.format_resources(params[:country], video, images)
  end
end