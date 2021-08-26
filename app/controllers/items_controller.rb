class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user).order("created_at ASC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:item_description,:category_id,:state_id,:delivery_fee_burden_id,:shipment_source_prefecture_id,:price,:days_to_ship_id,:image).merge(user_id: current_user.id)
  end


end
