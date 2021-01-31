class BuyerAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :address, :city, :building, :phone_number
  
  VALID_POSTCODE_REGEX= /\A\d{3}[-]\d{4}\z/ #000-1234
  VALID_PHONENUMBER_REGEX= /\A\d{10,11}\z/ #ハイフンなし10桁or11桁電話番号


  with_options presence: true do
    validates :post_code       ,format: { with: VALID_POSTCODE_REGEX }
    validates :prefecture_id
    validates :address
    validates :city
    validates :phone_number    ,format: { with: VALID_PHONENUMBER_REGEX }
  end

  def save
    buyer = Buyer.create(user_id: user.id, item_id: item.id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, address: address, city: city, phone_number: phone_number)

    Item.create(name: name, price: price)

  end
end