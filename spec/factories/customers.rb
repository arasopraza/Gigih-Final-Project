FactoryBot.define do
  factory :customer do
    name { "Arsy Opraza" }
    phone { 8234222 }
    address { "Bandung" }
    email { "aras.opraza@gmail.com" }
  end

  factory :invalid_customer, parent: :customer do
    name { nil }
    phone { nil}
    address { nil }
    email { "aras.opraza@gmail.com" }
  end
end
