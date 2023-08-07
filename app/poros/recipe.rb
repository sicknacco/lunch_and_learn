class Recipe
  attr_reader :title,
              :url,
              :country,
              :image,
              :id

  def initialize(data, country)
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    @country = country
    @image = data[:recipe][:image]
    @id = nil
  end
end