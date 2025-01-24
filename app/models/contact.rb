class Contact < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :delete
  validates :name, :cpf, :cellphone, presence: true

  validates :cpf, uniqueness: { scope: :user_id, message: "CPF já cadastrado" }
end
