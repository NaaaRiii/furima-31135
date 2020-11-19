FactoryBot.define do
  factory :user_purchase do
    token {"tok_abcdefghijk00000000000000000"}
    post_number {"123-4567"}
    shipping_area_id {2}
    city {"横浜市緑区"}
    street_address {"青山1-1-1"}
    building{"柳ビル103"}
    phone_number{"09012341234"}
  end
end
