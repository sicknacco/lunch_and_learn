require 'rails_helper'

RSpec.describe CountryService do
  it 'can create a connection, and get a single country', :vcr do
    country = CountryService.new.one_country('Thailand')
 
    expect(country).to be_an Array
    expect(country[0]).to have_key :name
    expect(country[0][:name]).to have_key :common
    expect(country[0][:name][:common]).to be_a String
    expect(country[0][:name][:common]).to eq('Thailand') # < Country Name
  end

  it 'can create a connection, and get all countries', :vcr do
    countries = CountryService.new.all_countries

    expect(countries).to be_an Array
    countries.each do |country|
      expect(country).to have_key :name
      expect(country[:name]).to have_key :common
    end
  end
end