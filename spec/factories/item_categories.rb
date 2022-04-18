FactoryBot.define do
  factory :item_category do
    item_id { 1 }
    category_id { 1 }
  end

  factory :invalid_item_category, parent: :item_category do 
    item_id { 1 }
    category_id { 1 }
  end
end
