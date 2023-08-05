require 'rails_helper'

RSpec.describe CountryService do
  it 'can create a connection, and consume the api', :vcr do
    country = CountryService.new.get_country('Thailand')

    expect(country).to be_an Array
    expect(country[0]).to have_key :name
    expect(country[0][:name]).to have_key :common
    expect(country[0][:name][:common]).to be_a String
    expect(country[0][:name][:common]).to eq('Thailand')
  end
end