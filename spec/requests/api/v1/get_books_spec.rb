require 'rails_helper'

RSpec.describe 'Books API' do
  it 'can retrieve books data for a country capital' do
    country = 'Nigeria'
    quantity = 5

    get "/api/v1/book_search?location=#{country}&quantity=#{quantity}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    book_data = JSON.parse(response.body, symbolize_names: true)

    expect(book_data).to be_a Hash
    expect(book_data).to have_key :data
    expect(book_data[:data]).to be_a Hash

    expect(book_data[:data]).to have_key :id
    expect(book_data[:data][:id]).to eq(nil)
    expect(book_data[:data]).to have_key :type
    expect(book_data[:data][:type]).to eq("books")
    expect(book_data[:data]).to have_key :attributes
    expect(book_data[:data].size).to eq(3)

    expect(book_data[:data][:attributes]).to be_a Hash
    expect(book_data[:data][:attributes]).to have_key :city
    expect(book_data[:data][:attributes][:city]).to eq("Abuja")
    expect(book_data[:data][:attributes]).to have_key :total_books_found
    expect(book_data[:data][:attributes][:total_books_found]).to be_a Integer
    expect(book_data[:data][:attributes]).to have_key :books

    expect(book_data[:data][:attributes][:books]).to be_an Array
    
    book_data[:data][:attributes][:books].each do |book|
      expect(book).to have_key :isbn
      expect(book[:isbn]).to be_an Array
      expect(book).to have_key :title
      expect(book[:title]).to be_a String
      expect(book).to have_key :publisher
      expect(book[:publisher]).to be_an Array
    end
  end
end