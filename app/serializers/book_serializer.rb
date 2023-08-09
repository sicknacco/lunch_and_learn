class BookSerializer
  def format_book_data(book_data, capital) ##<< -- book_data and capital are from the controller
    { 
      data: {
          id: nil,
          type: "books",
          attributes: { 
            city: capital,
            total_books_found: book_data[:numFound],
            books: [
              {
                isbn: [
                  book_data[:docs][0][:isbn]
                ],
                title: book_data[:docs][0][:title],
                publisher: [
                  book_data[:docs][0][:publisher]
                ]
              }
            ]
          } 
      }
    }
  end
end