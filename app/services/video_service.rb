class VideoService
  def get_video(country)
    response = conn.get('/youtube/v3/search') do |f|
      f.params['part'] = 'snippet'
      f.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      f.params['q'] = country
      f.params['type'] = 'video'
      f.params['maxResults'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://www.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end
end