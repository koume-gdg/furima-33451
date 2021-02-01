class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]
  before_action :move_soldout, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new

    @buyer = Buyer.new
    @buyers = @buyer.item
    # インデックスのフォームのあとの変数　＝　フォームオブジェクトの名前.new
  end

  def create
    @buyer_address = BuyerAddress.new(address_params)
    if @buyer_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: address_params[:token], # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def contributor_confirmation
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user != @item.user
  end

  def move_soldout
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.buyer == nil
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
