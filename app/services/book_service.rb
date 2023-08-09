class BookService
  def conn
    Faraday.new(url: 'https://openlibrary.org') 
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_books(capital, quantity)
    get_url("/search.json?q=#{capital}&limit=#{quantity}")
  end
end