class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render:new
    end
  end



  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :description, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :category_id).merge(user_id: current_user.id)
  end

end
