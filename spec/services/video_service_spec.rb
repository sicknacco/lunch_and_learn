require 'rails_helper'

RSpec.describe VideoService do
  it 'can create a connection, and get a video', :vcr do
    country = 'Laos'
    video_data = VideoService.new.get_video("#{country}")

    expect(video_data).to be_a Hash
    expect(video_data).to have_key :items

    video_data[:items].each do |video|
      expect(video).to have_key :snippet
      expect(video[:snippet]).to be_a Hash
      expect(video[:snippet]).to have_key :title
      expect(video[:snippet][:title]).to be_a String
      expect(video).to have_key :id
      expect(video[:id]).to have_key :videoId
    end
  end
end