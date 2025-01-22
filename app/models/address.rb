class Address < ApplicationRecord
  belongs_to :contact

  geocoded_by :full_address, latitude: :lat, longitude: :lon
  reverse_geocoded_by :latitude, :longitude

  before_save :update_coordinates
  before_update :update_coordinates

  def full_address
    "#{street}, #{city}, #{state} #{zip_code}"
  end

  private

  def update_coordinates
    ::Geocode::Coordinates::Update.call(address: self)
  end
end
