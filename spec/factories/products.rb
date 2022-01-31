FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    price { 80 }
    stock { 100 }
    category_id { 1 }
  end
end
