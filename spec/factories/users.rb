FactoryBot.define do
  factory :user do
    nickname              {Faker::name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Gimei::last.kanji}
    first_name            {Gimei::first.kanji}
    family_name_reading   {Gimei::last.katakana}
    first_name_reading    {Gimei::first.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end