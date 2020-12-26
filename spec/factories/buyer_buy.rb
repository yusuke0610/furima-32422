FactoryBot.define do
  factory :buyer_buy do

    postal_code { "123-1234" }
    shipping_area_id { 2 }
    city {"高知市"}
    address {"高知1-2-3"}
    phone_number { "12345678911" }
    building {"アパート"}
    token { "tok_6ccef7b1a48cec3bc80e65102b39" }
    
    association :user
    association :item
    
  end
end



