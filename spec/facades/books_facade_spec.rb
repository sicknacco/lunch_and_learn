require 'rails_helper'

RSpec.describe BooksFacade do
  describe 'class methods' do
    describe '.get_books' do
      it 'returns an array of book objects', :vcr do
        books = BooksFacade.new.city_books('bangkok', 5)

        # expect(books).to be_an Array
        expect(books.first).to be_a Book
      end
    end
  end
end