FactoryBot.define do
  factory :category do
    name { "Main Dish" }
  end

  factory :invalid_category, parent: :category do
    name { nil }
  end
end
