class Book
  attr_reader :title,
              :publisher,
              :isbn,
              :location,
              :quantity

  def initialize(data, location, quantity)

    @title = data[:books][:title]
    @publisher = data[:books][:publisher]
    @isbn = data[:books][:isbn]
    @quantity = quantity
    @location = location
  end
end