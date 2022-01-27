FactoryBot.define do
  factory :sale do
    sold_date { Date.new }
    product_id { 1 }
  end
end
