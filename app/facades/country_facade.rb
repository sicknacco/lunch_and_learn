class CountryFacade
  def self.get_country(country)
    if country.nil?
      country_names = CountryService.new.all_countries.map do |country_data| #< all_countries is a method in CountryService
        country_data[:name][:common]
      end
      country_names.sample
    else
      country
    end
  end
end