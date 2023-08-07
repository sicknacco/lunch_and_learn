class AirQualityService
  def conn
    Faraday.new(url: 'https://api.api-ninjas.com/v1') do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['X-Api-Key'] = ENV['AIR_QUALITY_API_KEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def air_quality_data(country)
    get_url("airquality?country=#{country}")
  end
end