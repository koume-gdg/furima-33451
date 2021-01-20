class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
         VALID_PASSWORD_REGEX = /[a-z\d]{6,}/i #[a-z\d]は英数字,{6,}は下限と上限、/iは大文字も小文字も含む
         VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/ #全角カタカナ
         VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/ #全角ひらがな、カタカナ、漢字

         validates :nickname,           presence: true
         validates :email,              uniqueness: true
         validates :family_name,        presence: true,  format: {with: VALID_NAME_REGEX}
         validates :first_name,         presence: true,  format: {with: VALID_NAME_REGEX}
         validates :family_name_kana,   presence: true, format: {with: VALID_KANA_REGEX}
         validates :first_name_kana,    presence: true, format: {with: VALID_KANA_REGEX}
         validates :birthday,           presence: true
         validates :encrypted_password, format: {with: VALID_PASSWORD_REGEX}
         validates :password,           format: {with: VALID_PASSWORD_REGEX}

end
