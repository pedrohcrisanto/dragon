# config/initializers/geocoder.rb
Geocoder.configure(
  api_key: Rails.application.credentials.google_maps_secret_key!
)
