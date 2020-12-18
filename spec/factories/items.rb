FactoryBot.define do
  factory :item do
  title           {"タイトル"}
  explanation     {"これは説明です"}
  category_id     {'2'}
  condition_id    {'2'}
  delivery_fee_id {'2'}
  shipping_area_id {'2'}
  days_ship_id  {'2'}
  value  {'1000'}
  
  association :user
 
  after(:build) do |message|
    message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
  end

  end
end
  