# config/initializers/geocoder.rb
Geocoder.configure(
  api_key: ENV['GOOGLE_MAPS_API_KEY']
)