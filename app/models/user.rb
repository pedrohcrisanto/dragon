class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable
  has_many :contacts, dependent: :destroy

  def jwt_payload
    { 'foo' => 'bar' }
  end
end
