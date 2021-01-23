class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day
  belongs_to :status
  belongs_to :category

  VALID_PRICE_REGEX = /\A[0-9]+\z/ #半角数字

  with_options presence: true do
    validates :image
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price,            format: { with: VALID_PRICE_REGEX }, inclusion: {in: 300..9999999}
  end
  

end
