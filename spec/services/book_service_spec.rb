require 'rails_helper'

RSpec.describe BookService do
  describe 'methods' do
    it 'can get a list of books about a city', :vcr do
      books = BookService.new.get_books('thailand', 5)

      expect(books).to be_a Hash
    end
  end
end