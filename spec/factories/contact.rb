FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    cpf { Faker::CPF.pretty }
    cellphone { Faker::PhoneNumber.cell_phone }
    user { create(:user) }

    trait :with_address do
      address { create(:address) }
    end
  end
end