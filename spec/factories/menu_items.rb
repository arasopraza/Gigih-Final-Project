FactoryBot.define do
  factory :menu_item do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { 10000.0 }
  end
end