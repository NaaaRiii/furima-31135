require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe "購入情報の保存" do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_purchase).to be_valid
    end

    it "post_numberが空では登録できないこと" do
      @user_purchase.post_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Post number can't be blank")
    end

    it "post_numberは半角のハイフンを含んだ正しい形式でないと保存できないこと" do
      @user_purchase.post_number = '1234567'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
    end

    it "shipping_area_idは1では保存できないこと" do
      @user_purchase.shipping_area_id = 1
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Shipping area must be other than 1")
    end

    it "cityがからでは保存できないこと" do
      @user_purchase.city = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end

    it "street_addressがからでは保存できないこと" do
      @user_purchase.street_address = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Street address can't be blank")
    end

    it 'buildingは空でも保存できること' do
      @user_purchase.building = nil
      expect(@user_purchase).to be_valid
    end

    it "phone_numberがからでは保存できないこと" do
      @user_purchase.phone_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberはハイフンは不要で、11桁以内であること" do
      @user_purchase.phone_number = "090123412345"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it "tokenが空では登録できないこと" do
      @user_purchase.token = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end