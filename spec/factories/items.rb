FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { 'サンプル説明です' }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }
    price { 1000 }
    association :user
  end
end
