# require 'rails_helper'

# RSpec.describe Book do
#   it 'exists and has attributes', :vcr do
#     data = {
#       books: {
#         title: "Bangkok",
#         publisher: "Lonely Planet",
#         isbn: '249785'
#       }
#     }
#     location = CountryFacade.new.get_capital('thailand')
#     quantity = 5
#     book = Book.new(data, location, quantity)

#     expect(book).to be_an_instance_of(Book)
#     expect(book.title).to eq("Bangkok")
#     expect(book.publisher).to eq("Lonely Planet")
#     expect(book.isbn).to eq('249785')
#     expect(book.location).to eq("Bangkok")
#     expect(book.quantity).to eq(5)
#   end
# end