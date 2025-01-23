
  class AddressBlueprint < Blueprinter::Base
    fields :street, :city, :state, :zip_code, :number, :complement, :country,
           :latitude, :longitude
  end
