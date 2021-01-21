class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day
  belongs_to :status
  belongs_to :category

end
