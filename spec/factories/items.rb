FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { 'サンプル説明です' }
    category { Category.all.sample }
    status { Status.all.sample }
    shipping_cost { ShippingCost.all.sample }
    prefecture { Prefecture.all.sample }
    shipping_day { ShippingDay.all.sample }
    price { '1000' }
    association :user
  end
end
