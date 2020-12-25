class BuyersController < ApplicationController
  def index
    @buyer = BuyerBuy.new
  end
  
  def new
    @buyer = BuyerBuy.new
  end

  def create 
    @buyer = BuyerBuy.new(buy_params)
    if pay_item
       @buyer.save
       redirect_to root_path
    else
       render :index
    end

  end
  
  private
  def buy_params
    params.require(:buyer_buy).permit( :postal_code, :shipping_area_id, :city, :address, :building, :phone_number).merge(buy_id: params[:item_id])
  end                                                                                                       

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: buy_params[:price],  
        card: buy_params[:token],    
        currency: 'jpy'                 
      )
  end
end
