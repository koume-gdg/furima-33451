require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  describe '購入機能' do
    context '購入できるとき' do
      it '全て入力されていれば購入できる' do
        expect(@buyer_address).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @buyer_address.building = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '購入できないとき' do
      it 'post_codeが空では購入できない' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'prefecture_idが空では購入できない' do
        @buyer_address.prefecture_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end

      it 'Addressが空では購入できない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'post_codeにハイフンが無いと購入できない' do
        @buyer_address.post_code = '1111111'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Post code is invalid')
      end

      it 'phone_numberが11桁以上では購入できない' do
        @buyer_address.phone_number = '123456789012'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberにハイフンがあると購入できない' do
        @buyer_address.phone_number = '123-4567-89'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが数字のみでないと登録できない' do
        @buyer_address.phone_number = 'a1234567890'
      end

      it 'tokenが空では登録できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end

       it 'user_idが空では登録できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
       end

       it 'item_idが空では登録できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
       end
    end
  end
end
