FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description{ 'サンプル説明です' }
    category { Category.all.sample }
    status { Status.all.sample }
    shipping_cost { Shipping_cost.all.sample }
    prefecture { Prefecture.all.sample }
    shipping_day { Shipping_day.all.sample }
    price { '1000' }
  end
end
