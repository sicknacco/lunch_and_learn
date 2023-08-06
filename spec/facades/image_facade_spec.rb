require 'rails_helper'

RSpec.describe ImageFacade, :vcr do
  describe '#get_images' do
    it 'returns an array of images' do
      country = 'Thailand'
      images = ImageFacade.new.country_images(country)
      expect(images).to be_an Array
    end
  end
end