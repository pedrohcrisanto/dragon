class Address < ApplicationRecord
  belongs_to :contact

  geocoded_by :full_address, latitude: :lat, longitude: :lon
  reverse_geocoded_by :latitude, :longitude

  before_save :update_coordinates
  before_update :update_coordinates

  validates :city, :state, :street, :number, :zip_code, :country, presence: true

  def full_address
   [ street, number, city, state, country ].compact.join(", ")
  end

  private
  def update_coordinates
    self.geocode
  end
end
