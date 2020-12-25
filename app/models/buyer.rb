class Buyer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buy
  belongs_to :shipping_area
  
  
 

end



