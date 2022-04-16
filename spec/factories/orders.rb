FactoryBot.define do
  factory :order do
    customer_id { 1 }
    total { 1.5 }
    order_date { "2022-04-16" }
  end
end
