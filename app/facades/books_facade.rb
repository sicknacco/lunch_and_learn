class BooksFacade
  def city_books(location, quantity)
    books = BooksService.new.get_books(location, quantity)
    books.map do |book|
      Book.new(book)
    end
  end
end