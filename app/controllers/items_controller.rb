class ItemsController < ApplicationController
  before_action :authenticate_user!
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
       render :new
      end
  end
      
  def show
  end
  private
    def item_params
      params.require(:item).permit( :title, :explanation, :value ,:category_id ,:condition_id ,:delivery_fee_id ,:shipping_area_id ,:days_ship_id,:image ).merge(user_id: current_user.id)
    end
end
