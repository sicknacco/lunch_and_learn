require 'rails_helper'

describe 'Learning Resource API' do
  it 'can get learning resources for a chosen country', :vcr do
    country = 'Thailand'

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful

    resources = JSON.parse(response.body, symbolize_names: true)

    expect(resources).to be_a Hash
    expect(resources).to have_key :data
    expect(resources[:data]).to be_a Hash

    expect(resources[:data]).to have_key :id
    expect(resources[:data][:id]).to eq(nil)
    expect(resources[:data]).to have_key :type
    expect(resources[:data][:type]).to eq("learning_resource")
    expect(resources[:data]).to have_key :attributes
    expect(resources[:data][:attributes]).to be_a Hash

    expect(resources[:data][:attributes]).to have_key :country
    expect(resources[:data][:attributes][:country]).to eq(country)

    expect(resources[:data][:attributes]).to have_key :video
    expect(resources[:data][:attributes][:video]).to be_a Hash
    expect(resources[:data][:attributes][:video]).to have_key :title
    expect(resources[:data][:attributes][:video]).to have_key :youtube_video_id
    expect(resources[:data][:attributes][:video].keys.size).to eq(2)

    expect(resources[:data][:attributes]).to have_key :images
    expect(resources[:data][:attributes][:images]).to be_an Array
    expect(resources[:data][:attributes][:images].size).to eq(10)

    resources[:data][:attributes][:images].each do |image|
      expect(image).to have_key :alt_tag
      expect(image).to have_key :url
      expect(image.keys.size).to eq(2)
    end

    expect(resources[:data][:attributes].keys.size).to eq(3)
  end

  it 'returns an empty object if no videos or images can be found', :vcr do
    country = 'bigfootville'

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful

    resources = JSON.parse(response.body, symbolize_names: true)

    expect(resources).to be_a Hash
    expect(resources).to have_key :data
    expect(resources[:data]).to be_a Hash

    expect(resources[:data]).to have_key :id
    expect(resources[:data][:id]).to eq(nil)
    expect(resources[:data]).to have_key :type
    expect(resources[:data][:type]).to eq("learning_resource")
    expect(resources[:data]).to have_key :attributes
    expect(resources[:data][:attributes]).to be_a Hash

    expect(resources[:data][:attributes]).to have_key :country
    expect(resources[:data][:attributes][:country]).to eq(country)
    expect(resources[:data][:attributes]).to have_key :video
    expect(resources[:data][:attributes][:video]).to eq({})
    expect(resources[:data][:attributes]).to have_key :images
    expect(resources[:data][:attributes][:images]).to eq([])
  end
end