FactoryBot.define do
  factory :menu_item do
    name { Faker::Food.dish }
    description { Faker::Food.description[1..150] }
    price { 10000.0 }
  end

  factory :invalid_menu_item, parent: :menu_item do
    name { nil }
    description { nil }
    price { 10000.0 }
  end
end