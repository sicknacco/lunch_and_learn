class Api::V1::LearningResourcesController < ApplicationController
  def index
    video = VideoFacade.new.video(params[:country])
    images = ImageFacade.new.country_images(params[:country])
    if video.nil? || images.empty?
      render json: LearningResourcesSerializer.new.format_empty_resources(params[:country])
    else
      render json: LearningResourcesSerializer.new.format_resources(params[:country], video, images)
    end
  end
end