require 'rails_helper'

RSpec.describe Image do
  it 'exists and has attributes' do
    data = {
      alt_description: "standing statue and temples landmark during daytime",
      urls: {
        regular: "https://images.unsplash.com"
      }
    }

    image = Image.new(data)

    expect(image).to be_an_instance_of(Image)
    expect(image.alt_tag).to eq("standing statue and temples landmark during daytime")
    expect(image.url).to eq("https://images.unsplash.com")
  end
end