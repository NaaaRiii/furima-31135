require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  context "購入できる時" do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_purchase).to be_valid
    end
  end

  context "購入できない時" do
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

    it "phone_numberは11桁以内であること" do
      @user_purchase.phone_number = "090123412345"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberはハイフンは不要であること" do
      @user_purchase.phone_number = "090-1234-1234"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it "tokenが空では登録できないこと" do
      @user_purchase.token = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end

    it "user_idが空では購入できないこと" do
      @user_purchase.user_id = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では購入できないこと" do
      @user_purchase.item_id = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
    end
  end
end