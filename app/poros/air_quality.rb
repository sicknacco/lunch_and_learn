# class AirQuality
#   attr_reader :country,
#               :aqi,
#               :pm25_concentration,
#               :co_concentration

#   def initialize(data, country)
#     @country = country
#     @aqi = data[:overall_aqi]
#     @pm25_concentration = data[:"PM2.5"][:concentration]
#     @co_concentration = data[:CO][:concentration]
#   end
# end