FactoryBot.define do
  factory :buyer_address do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '千代田区' }
    address { '1-1' }
    building { '皇居' }
    phone_number { '00011112222' }
    token { 'tok_abcdefghijk00000000000000000' }

  end
end
