class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i # [a-z\d]は英数字,{6,}は下限と上限、/iは大文字も小文字も含む
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/ # 全角カタカナ
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/ # 全角ひらがな、カタカナ、漢字

  with_options presence: true do
    validates :nickname
    validates :family_name,      format: { with: VALID_NAME_REGEX }
    validates :first_name,       format: { with: VALID_NAME_REGEX }
    validates :family_name_kana, format: { with: VALID_KANA_REGEX }
    validates :first_name_kana,  format: { with: VALID_KANA_REGEX }
    validates :birthday
  end

  validates :password,           format: { with: VALID_PASSWORD_REGEX }
end
