require 'rails_helper'

RSpec.describe VideoFacade, :vcr do
  describe '#video' do
    it 'returns a video' do
      country = 'Laos'
      video_data = VideoFacade.new.video(country)

      expect(video_data).to be_a(Video)
    end

    it 'returns a video with the correct attributes' do
      country = 'Laos'
      video_data = VideoFacade.new.video(country)

      expect(video_data.title).to eq("A Super Quick History of Laos")
      expect(video_data.youtube_video_id).to eq("uw8hjVqxMXw")
    end

    it 'returns an empty hash if no video is found' do
      country = 'bigfootville'
      video_data = VideoFacade.new.video(country)

      expect(video_data).to eq({})
    end
  end
end