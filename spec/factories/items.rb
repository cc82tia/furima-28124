FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    condition_id { 2 }
    delivery_charge_id { 2 }
    delivery_source_id { 2 }
    days_of_ships_id { 2 }
    price { Random.rand(300 .. 9999999) }
    category_id { 2 }
    association :user
  end

end
