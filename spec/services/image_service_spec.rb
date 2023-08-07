require 'rails_helper'

RSpec.describe ImageService do
  it 'can create a connection, and consume the api', :vcr do
    images = ImageService.new.get_images('Thailand')

    expect(images).to be_an Hash
    expect(images).to have_key :results
    
    images[:results].each do |image|
      expect(image).to have_key :alt_description
      expect(image).to have_key :urls
      expect(image[:urls]).to have_key :regular
    end
  end
end