class UserPurchase
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :street_adress, :building, :phone_number

  with_options presense: true do
    validates :post_number
    validates :prefecture_id
    validates :city
    validates :street_adress
    validates :building
    validates :phone_number
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.create(nickname: nickname)
    # 住所の情報を保存
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, street_adress: street_adress, building: building, phone_number: phone_number, user_id: user.id)
    # 購入の情報を保存
    Purchase.create(user_id: user.id, item_id: item.id)
  end
end