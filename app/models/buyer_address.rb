class BuyerItem

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :address, :city, :building, :phone_number

  def save
    buyer = Buyer.create(user_id: user.id, item_id: item.id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, address: address, city: city, phone_number: phone_number)

    Item.create(name: name, price: price, d)

  end
  
  with_options presence: true do
    validates :post_code,       format: { :VALID_POSTCODE }
    validates :prefecture_id
    validates :address
    validates :city
    validates :phone_number,    format: { :VALID_PHONENUMBER }
  end

end
