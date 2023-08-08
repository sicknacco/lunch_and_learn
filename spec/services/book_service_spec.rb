require 'rails_helper'

RSpec.describe BookService do
  describe 'methods' do
    it 'can get a list of books about a city', :vcr do
      books = BookService.new.get_books('bangkok', 5)

      expect(books).to be_a Hash
      expect(books).to have_key :docs
      expect(books[:docs]).to be_an Array
    end
  end
end