class Contact < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy

  validates :cpf, uniqueness: { scope: :user_id, message: "CPF já cadastrado" }
  # validates :cpf, if: -> { cpf.valid? }
end
