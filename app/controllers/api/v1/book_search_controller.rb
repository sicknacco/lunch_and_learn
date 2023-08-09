class Api::V1::BookSearchController < ApplicationController
  def index
    capital = CountryFacade.new.get_capital(params[:location])
    book_data = BookService.new.get_books(capital, params[:quantity])
    render json: BookSerializer.new.format_book_data(book_data, capital)
  end
end