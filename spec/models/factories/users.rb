FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {person.first.kanji}
    first_name            {person.last.kanji}
    family_name_kana      {person.first.katakana}
    first_name_kana       {person.last.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end