class UserPurchase 
  include ActiveModel::Model
  attr_accessor :token, :post_number, :shipping_area_id, :city, :street_address, :building, :phone_number, :item_id, :user_id, :purchase_id

  with_options presense: true do
    validates :city
    validates :street_address
    validates :phone_number
    validates :token
    validates :purchase_id
  end

  # 「住所」の郵便番号に関するバリデーション
  validates :post_number, presense: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  with_options presense: true, numericality: { other_than: 1 } do
    validates :shipping_area_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, shipping_area_id: shipping_area_id, city: city, street_address: street_address, building: building, phone_number: phone_number, purchase_id: purchase.id)    
  end
end