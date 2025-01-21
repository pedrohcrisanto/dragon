class Address < ApplicationRecord
  belongs_to :contact

  validates :cep, :street, :number, presence: true
end
