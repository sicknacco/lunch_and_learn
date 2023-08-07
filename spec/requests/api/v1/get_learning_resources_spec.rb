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
  end
end