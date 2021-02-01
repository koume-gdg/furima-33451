class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day
  belongs_to :status
  belongs_to :category
  has_one :buyer

  VALID_PRICE_REGEX = /\A[0-9]+\z/ # 半角数字

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :category_id, inclusion: { in: 2..11 }
    validates :status_id, inclusion: { in: 2..7 }
    validates :shipping_cost_id, inclusion: { in: 2..3 }
    validates :prefecture_id, inclusion: { in: 2..48 }
    validates :shipping_day_id, inclusion: { in: 2..4 }
    validates :price, format: { with: VALID_PRICE_REGEX }, inclusion: { in: 300..9_999_999 }
  end
end
