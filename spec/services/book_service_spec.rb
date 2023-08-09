require 'rails_helper'

RSpec.describe BookService do
  describe 'methods' do
    it 'can get a list of books about a city', :vcr do
      books = BookService.new.get_books('bangkok', 5)

      expect(books).to be_a Hash
      expect(books).to have_key :docs
      expect(books[:docs]).to be_an Array

      book = books[:docs].first

      expect(book).to have_key :title
      expect(book[:title]).to be_a String

      expect(book).to have_key :publisher
      expect(book[:publisher]).to be_an Array

      expect(book).to have_key :isbn
      expect(book[:isbn]).to be_an Array
    end
  end
end