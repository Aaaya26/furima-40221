FactoryBot.define do
  factory :order_address do
    post_code     {Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    municipality  {Faker::Address.city}
    street        {Faker::Address.street_address}
    building_name {Faker::Address.street_name}
    phone_number  {Faker::Number.leading_zero_number(digits: 11)}
    token         {Faker::Alphanumeric.alphanumeric(number: 30)}
  end
end
