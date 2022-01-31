FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
    max { 1000 }
  end
end
