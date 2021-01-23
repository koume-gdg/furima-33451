require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規投稿する' do
    context '投稿できるとき' do
      it '全ての入力ができていれば投稿される' do
        expect(@item).to be_valid
      end
    end
    end
    
  end




end
