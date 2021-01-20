require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "全ての情報が入力できていれば登録できる" do
        expect(@user).to be_valid
      end
    end

     context '新規登録できないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複して存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameが全角ひらがな、カタカナ、漢字ではないと登録できない" do
        @user.family_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角ひらがな、カタカナ、漢字ではないと登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name _kanaが全角カタカナではないと登録できない" do
        @user.family_name_kana = "ｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_nam_kanaeが全角カタカナではないと登録できない" do
        @user.first_name_kana = "ｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字未満だと登録できない" do
        @user.password = "123ab"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordがアルファベットだけでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end

