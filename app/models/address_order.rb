class AddressOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token


  validates :postal_code, presence: true , format: { with: /\A\d{3}[-]\d{4}\z/ } 
  validates :phone_number,presence: true , format: { with: /\A[0-9]+\z/ } 
  validates :phone_number,length: { maximum: 11 }

  with_options presence: true do
    validates :city
    validates :address
    validates :token
    validates :user_id
    validates :item_id
  end

    validates :shipping_area_id, numericality: { other_than: 1 }, presence: true
  

  def save
    order = Order.create( user_id: user_id ,item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building: building, phone_number: phone_number,order_id: order.id )
  end
end