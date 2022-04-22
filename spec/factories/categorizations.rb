FactoryBot.define do
  factory :categorization do
    menu_id { 1 }
    category_id { 1 }
  end

  factory :invalid_categorization, parent: :categorization do 
    menu_id { nil }
    category_id { nil }
  end
end
