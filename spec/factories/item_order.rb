FactoryBot.define do
  # factory :order do
  #   association :user
  #   association :item
  # end
  
  # factory :address do
  #   postal_code { "982-3456" }
  #   delivery_source_id { 2 }
  #   city {Gimei::address.city.kanji}
  #   house_number {Gimei::address.town.kanji  }
  #   building_number { 7 }
  #   phone_number { 123456789 }
  #   association :order
  # end

  factory :item_order do
    user_id { 1 }
    item_id { 1 }
    postal_code { "982-3456" }
    delivery_source_id { 2 }
    city {Gimei::address.city.kanji}
    house_number {Gimei::address.town.kanji  }
    building_number { 7 }
    phone_number { 1234567890 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end