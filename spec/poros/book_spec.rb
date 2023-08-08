require 'rails_helper'

RSpec.describe Book do
  it 'exists and has attributes' do
    data = {
      books: {
        title: "Bangkok",
        publisher: "Lonely Planet",
        isbn: '249785'
      }
    }
    location = CountryFacade.new.get_capital('thailand')
    quantity = 5
    book = Book.new(data,location, quantity)

    expect(book).to be_an_instance_of(Book)
  end
end