require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe "購入情報の保存" do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_purchase).to be_valid
      binding.pry
    end

    it "post_numberが空では登録できないこと" do
      @user_purchase.post_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Post number can't be blank")
    end

    it "post_numberは半角のハイフンを含んだ正しい形式でないと保存できないこと" do
      @user_purchase.post_number = '1234567'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Post Number is invalid. Include hyphen(-)")
    end

    it "shipping_area_idを選択していないと保存できないこと" do
      @user_purchase.shipping_area_id = 0
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Shipping Area can't be blank")
    end

    it "cityがからでは保存できないこと" do
      @user_purchase.city = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end

    it "street_addressがからでは保存できないこと" do
      @user_purchase.street_address = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Street Address can't be blank")
    end

    it 'buildingは空でも保存できること' do
      @user_purchase.building = nil
      expect(@user_purchase).to be_valid
    end

    it "phone_numberがからでは保存できないこと" do
      @user_purchase.phone_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone Number can't be blank")
    end

    it "電話番号にはハイフンは不要あること" do
      @user_purchase.phone_number = "090-1234-1234"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone")
    end

    it "11桁以内であること（09012341234となる" do
    end

    it "tokenが空では登録できないこと" do
      @user_purchase.token = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end