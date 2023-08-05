class CountryService
  def conn
    Faraday.new(url: 'https://restcountries.com/v3.1') do |faraday|
    end
  end

  def get_country(country)
    response = conn.get("name/#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_countries
    response = conn.get('all')
    JSON.parse(response.body, symbolize_names: true)
  end
end