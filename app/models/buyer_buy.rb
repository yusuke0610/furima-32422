class BuyerBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :adrress, :building, :phone_number

  # has_one :buyer
  # has_one :buy

  with_options presence: true , format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :postal_code 
  end

  with_options presence: true ,format: { with: /\A[0-9]+\z/ } do
    validates :phone_number
  end

  with_options presence: true do
    validates :shipping_area_id
    validates :city
    validates :adrress
    validates :token
  end
  

  def save
    buy = Buy.create( user_id: user.id ,item_id: item.id)
    Buyer.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, adrress: adrress, building: building, phone_number: phone_number,buy_id: buy.id )
    
  end
end