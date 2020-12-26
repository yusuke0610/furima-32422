require 'rails_helper'

RSpec.describe BuyerBuy, type: :model do
  describe "商品購入機能" do
    before do
      @buyer_buy = FactoryBot.build(:buyer_buy)
    end

    context "商品購入がうまくいく時" do

      it "郵便番号、都道府県、市町村、番地、電話番号,カード情報が全て入力される時" do
        expect(@buyer_buy).to be_valid
      end

    end

    context "商品購入がうまくいかない時" do
      
       it "郵便番号が空のとき" do
        @buyer_buy.postal_code = ""
        @buyer_buy.valid?
        expect(@buyer_buy.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
       end


       it "郵便番号がハイフンが含まれてない時" do
        @buyer_buy.postal_code = 1234567
        @buyer_buy.valid?
        expect(@buyer_buy.errors.full_messages).to include("Postal code is invalid")
       end

       it "郵便番号が3桁-4桁でない時" do
        @buyer_buy.postal_code = 1234-123
        @buyer_buy.valid?
        expect(@buyer_buy.errors.full_messages).to include("Postal code is invalid")
       end

       it "都道府県が入力されていない時" do
        @buyer_buy.shipping_area_id = ""
        @buyer_buy.valid? 
        expect(@buyer_buy.errors.full_messages).to include( "Shipping area can't be blank")
       end

       it "都道府県が存在しない時" do
        @buyer_buy.shipping_area_id = nil
        @buyer_buy.valid?
        expect(@buyer_buy.errors.full_messages).to include( "Shipping area can't be blank")
       end

       it "市町村が入力されていない時" do
        @buyer_buy.city = ""
        @buyer_buy.valid?
        expect(@buyer_buy.errors.full_messages).to include( "City can't be blank")
       end

       it "番地が入力されていない時" do
        @buyer_buy.address = ""
        @buyer_buy.valid?
        expect(@buyer_buy.errors.full_messages).to include( "Address can't be blank")
       end

       it "電話番号が入力されていない時" do
        @buyer_buy.phone_number = ""
        @buyer_buy.valid?
        expect(@buyer_buy.errors.full_messages).to include("Phone number can't be blank","Phone number is invalid")
       end


       it "カード情報が入力されていない" do
        @buyer_buy.token = ""
        @buyer_buy.valid?
        expect(@buyer_buy.errors.full_messages).to include( "Token can't be blank") 
       end
      
    end
 end
end

 
