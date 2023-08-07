class ImageFacade
  def country_images(country)
    images = ImageService.new.get_images(country)
    images.map do |image|
      Image.new(image)
    end
  end
end