class RecipeService
  def conn
    Faraday.new(url: 'https://api.edamam.com') do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.params['type'] = 'public'
      faraday.params['app_id'] = ENV['EDAMAM_ID']
      faraday.params['app_key'] = ENV['EDAMAM_KEY']
    end
  end

  def get_recipe(country)
    response = conn.get("/api/recipes/v2?q=#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
end