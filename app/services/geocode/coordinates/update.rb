module Geocode
  module Coordinates
    class Update < Micro::Case
      attributes :address

      def call!
        update_lat_long
      end

      private

      def update_lat_long
        address.update(latitude: geocode.latitude, longitude: geocode.longitude)
      end

      def geocode
        Geocoder.search(address.full_address)&.first
      end
    end
  end
end
