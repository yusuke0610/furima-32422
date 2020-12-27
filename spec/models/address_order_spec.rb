require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe "商品購入機能" do
    before do
      user = FactoryBot.create(:user) 
      sleep 1
      item = FactoryBot.create(:item)
      @address_order = FactoryBot.build(:address_order, user_id:user.id, item_id:item.id)
    end

    context "商品購入がうまくいく時" do

      it "郵便番号、都道府県、市町村、番地、電話番号,カード情報,建物が入力された時" do
        expect(@address_order).to be_valid
      end

      it "建物は空でも登録できる" do
        @address_order.building = ""
        expect(@address_order).to be_valid
      end

     end

    context "商品購入がうまくいかない時" do
      
       it "郵便番号が空のとき" do
        @address_order.postal_code = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
       end


       it "郵便番号がハイフンが含まれてない時" do
        @address_order.postal_code = "1234567"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code is invalid")
       end

       it "郵便番号が3桁-4桁でない時" do
        @address_order.postal_code = "1234-123"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code is invalid")
       end

       it "都道府県が入力されていない時" do
        @address_order.shipping_area_id = 1
        @address_order.valid? 
        expect(@address_order.errors.full_messages).to include( "Shipping area must be other than 1")
       end

       it "都道府県が存在しない時" do
        @address_order.shipping_area_id = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include( "Shipping area can't be blank")
       end

       it "市町村が入力されていない時" do
        @address_order.city = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include( "City can't be blank")
       end

       it "番地が入力されていない時" do
        @address_order.address = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include( "Address can't be blank")
       end

       it "電話番号が入力されていない時" do
        @address_order.phone_number = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number can't be blank","Phone number is invalid")
       end

       it "電話番号は12桁以上では登録できないこと" do
        @address_order.phone_number = "123456789123"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
       end
       it "電話番号は英数混合では登録できないこと" do
        @address_order.phone_number = "12345aaaaa1"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
       end
       it "カード情報が入力されていない" do
        @address_order.token = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include( "Token can't be blank") 
       end
      
    end
 end
end

 
