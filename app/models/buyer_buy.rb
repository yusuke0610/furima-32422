class BuyerBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token


  with_options presence: true , format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :postal_code 
  end

  with_options presence: true ,format: { with: /\A[0-9]+\z/ } do
    validates :phone_number
  end
  validates :phone_number,length: { maximum: 11 }

  with_options presence: true do
    validates :shipping_area_id
    validates :city
    validates :address
    validates :token
    validates :user_id
    validates :item_id
  end
  

  def save
    buy = Buy.create( user_id: user_id ,item_id: item_id)
    Buyer.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building: building, phone_number: phone_number,buy_id: buy.id )
  end
end