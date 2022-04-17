FactoryBot.define do
  factory :order do
    customer_id { 1 }
    total { 1.5 }
    order_date { "2022-04-16" }
    status { "NEW" }
  end

  factory :invalid_order, parent: :order do
    customer_id { nil }
    total { nil }
    order_date { nil }
    status { nil }
  end
end
