require 'rails_helper'

RSpec.describe CountryFacade, :vcr do
  describe '#get_country' do
    it "returns random country when 'country' is nil" do
      random_country = CountryFacade.get_country(nil)
      
      expect(random_country).to be_a String
      expect(random_country).to_not be_empty
    end

    it "returns the country when 'country' is not nil" do
      country = CountryFacade.get_country('Thailand')

      expect(country).to be_a String
      expect(country).to_not be_empty
      expect(country).to eq('Thailand')
    end

    it "can return the capital of a country" do
      capital = CountryFacade.new.get_capital('Thailand')

      expect(capital).to be_a String
      expect(capital).to eq('Bangkok')
    end
  end
end