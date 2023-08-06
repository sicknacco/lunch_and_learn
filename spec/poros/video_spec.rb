require 'rails_helper'

RSpec.describe Video do
  it 'exists and has the correct attributes' do
    data = {
      id: { videoId: "uw8hjVqxMXw" },
      snippet: { title: "A Super Quick History of Laos" }
    }

    video = Video.new(data)
    expect(video).to be_an_instance_of(Video)
    expect(video.title).to eq("A Super Quick History of Laos")
    expect(video.youtube_video_id).to eq("uw8hjVqxMXw")
  end
end