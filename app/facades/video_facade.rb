class VideoFacade
  def video(country)
    video = VideoService.new.get_video(country) #< get_video is a method in VideoService
    video[:items].map do |video_data|
      Video.new(video_data)
    end.first || {}  #< this is the first video in the array, or an empty hash if no video is found
  end
end