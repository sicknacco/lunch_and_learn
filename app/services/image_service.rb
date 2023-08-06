class ImageService
  def conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['X-Total'] = '10'
      faraday.params['client_id'] = ENV['UNSPLASH_KEY']
    end
  end

  def get_images(country)
    response = conn.get("/search/photos?query=#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
end