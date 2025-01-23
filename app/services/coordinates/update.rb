
  module Coordinates
    class Update < Micro::Case
      attributes :address

      def call!
        update_lat_long
      end

      private

      def update_lat_long
        binding.pry
        address.update(latitude: geocode.latitude, longitude: geocode.longitude)
      end

      def geocode
        Geocoder.search("Brazil", params: {city: address.city, road: address.street} )
      end
    end
  end

