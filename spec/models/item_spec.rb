require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
     it 'タイトル、説明、カテゴリー、状態、配送料の負担、地域、発送までの日数、価格が入力されている' do
      expect(@item).to be_valid
     end
    
    end
    
    context '商品出品登録がうまくいかないとき' do

      it '写真が空の時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'タイトルが空の時' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '説明が空の時' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it '価格が空の時' do
        @item.value = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank", "Value is invalid", "Value is not a number")
      end
      it 'カテゴリーが空になっている' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '状態が空になっている' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料負担が空になっている' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it '発送地域が空になっている' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it '発送までの日数が空になっている' do
        @item.days_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship can't be blank","Days ship is not a number","Days ship can't be blank")
      end

      
    end
end
end
