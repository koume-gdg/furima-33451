class Address < ApplicationRecord
  belongs_to :buyer

  VALID_POSTCODE = /\A\d{3}[-]\d{4}\z/ #000-1234
  VALID_PHONENUMBER = /\A\d{10,11}\z/ #ハイフンなし10桁or11桁電話番号

  
  
end
