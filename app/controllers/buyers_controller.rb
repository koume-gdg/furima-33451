class BuyersController < ApplicationController
  def index
    @buyer_address = BuyerAddress.new
    
    @item = Item.find(params[:item_id])
    @buyer = Buyer.new
    @buyers = @buyer.item
    #インデックスのフォームのあとの変数　＝　フォームオブジェクトの名前.new
  end

  def creat
    @buyer_address = BuyerAddress.new(address_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render root_path
    end
  end


    private
    def address_params
      params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number)
    end
    

end
