class BooksFacade
  def city_books(location, quantity)
    books = BookService.new.get_books(location, quantity)
    books.map do |book|
      Book.new(book, location, quantity)
    end
  end
end