class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_category
  belongs_to :genre_condition
  belongs_to :genre_days_ship
  belongs_to :genre_delivery_fee
  belongs_to :genre


  with_options presence: true do
  validates :title         
  validates :explanation     
  validates :category_id      
  validates :condition_id     
  validates :delivery_fee_id  
  validates :shipping_area_id 
  validates :days_ship_id  
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
