class Contact < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy

  validates :cpf, uniqueness: true
end
