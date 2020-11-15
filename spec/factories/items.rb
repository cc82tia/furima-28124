FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    condition_id { 2 }
    delivery_charge { 2 }
    delivery_source_id { 2 }
    days_of_ships_id { 2 }
    price { 2 }
    category_id { 2 }
  end
end
