FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    zip_code { Faker::Address.zip_code }
    contact { create(:contact) }
  end
end
