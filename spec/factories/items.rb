FactoryBot.define do
  factory :item do
    product_name { "宮古島" }
    product_description { "宮古島の綺麗な海" }
    category_id { 2 } 
    product_condition_id { 3 }
    shipping_charge_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    price { 385 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end