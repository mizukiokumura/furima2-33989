class ItemsController < ApplicationController
  before_action :move_to_signed_in, only: [:edit, :update]
  before_action :move_to_show, only: [:edit, :update]
  before_action :set_item,     only: [:edit, :show, :update, :destroy]
  before_action :sold_out,     only: [:edit, :update]
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

  def show
    
  end

  def edit 
    
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end
  


  private
  def item_params
    params.require(:item).permit(:name,:item_description,:category_id,:state_id,:delivery_fee_burden_id,:shipment_source_prefecture_id,:price,:days_to_ship_id,:image).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_show
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
        redirect_to item_path(@item.id)
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def sold_out
    if @item.buy.present?
      redirect_to root_path
    end
  end


end
