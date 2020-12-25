class Buy < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :item
  has_one    :buyer
  belongs_to :buyer_buy
  

  
end
