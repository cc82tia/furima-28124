FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    condition_id { 1 }
    delivery_charge { 1 }
    delivery_source_id { 1 }
    days_of_ships_id { 1 }
    price { 1 }
    category_id { 1 }
  end
end
