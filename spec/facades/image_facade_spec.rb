require 'rails_helper'

RSpec.describe ImageFacade, :vcr do
  describe '#get_images' do
    it 'returns an array of images' do
      country = 'Thailand'
      images = ImageFacade.new.country_images(country)

      expect(images).to be_an Array
    end

    it 'returns all of the correct attributes' do
      country = 'Thailand'
      images = ImageFacade.new.country_images(country)

      expect(images).to all(be_a(Image))
      expect(images[0].alt_tag).to be_a String
      expect(images[0].url).to be_a String
    end

    it 'returns an empty array if no images are found' do
      country = 'bigfootville'
      images = ImageFacade.new.country_images(country)
      expect(images).to eq([])
    end
  end
end