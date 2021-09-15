class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :show_item,          only: [:index, :create]
  before_action :sold_out,           only: [:index, :create]
  def index
    @buy_street = BuyStreet.new
  end

  def create
    @buy_street = BuyStreet.new(buy_params)
    if @buy_street.valid?
      pay_buy
      @buy_street.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 

  def buy_params
    params.require(:buy_street).permit(:prefecture_id, :postal_code, :municipality, :address, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def show_item
    @item = Item.find(params[:item_id])
  end

  def pay_buy
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out
    if @item.buy.present? || @item.user.id == current_user.id
      redirect_to root_path
    end
  end
  
end
