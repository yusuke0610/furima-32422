class ItemsController < ApplicationController
   before_action :authenticate_user!, only: [:new, :edit]
   before_action :set_action, only: [:edit, :update, :show]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    if @item.user == current_user
    render :edit
    else
    redirect_to root_path
    end
  end

  def update
     if@item.update(item_params)
       @item.user == current_user
       redirect_to item_path(@item.id)
     else
      render :edit
  end
  end

  private
    def item_params
      params.require(:item).permit(:title, :explanation, :value ,:category_id ,:condition_id ,:delivery_fee_id ,:shipping_area_id ,:days_ship_id,:image ).merge(user_id: current_user.id)
    end
    def set_action
      @item = Item.find(params[:id])
    end
end
