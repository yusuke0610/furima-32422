class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :days_ship
  belongs_to :delivery_fee
  belongs_to :shipping_area


  with_options presence: true do
  validates :title         
  validates :explanation     
  validates :image  
  end

  with_options presence: true, format:{ with: /\A[0-9]+\z/ } do
  validates :value          
  end
  validates :value,            numericality: {:greater_than_or_equal_to => 300,:less_than_or_equal_to => 9999999 }

  with_options  numericality: { other_than: 1 } ,presence: true do
  validates :shipping_area_id
  validates :category_id
  validates :condition_id
  validates :days_ship_id
  validates :delivery_fee_id
  end
end
