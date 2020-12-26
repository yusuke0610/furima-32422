class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_actions, only: [:index,:create]
  def index
     @buyer = BuyerBuy.new
    if @item.user_id == current_user.id || @item.buy != @item.user_id
      redirect_to  root_path
    else
      render :index
    end
  end

  def new
  end

  def create 
    @buyer = BuyerBuy.new(buy_params)
    if @buyer.valid?
       pay_item
       @buyer.save
    return redirect_to root_path
    else
       render :index
    end
  end
  
  private
  def buy_params
    params.require(:buyer_buy).permit(:postal_code, :shipping_area_id, :city, :address, :building, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.value,
      card: params[:token],
      currency: 'jpy'
    )
  end
  
  def set_action
    @item = Item.find(params[:item_id])
  end

end
