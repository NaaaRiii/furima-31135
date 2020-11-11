require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができるとき' do
    it '全ての項目が満たされている' do
      expect(@item).to be_valid
    end
  end

  context '商品出品ができないとき' do
    it "商品名が必須であること" do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it "商品の説明が必須であること" do
      @item.product_description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態についての情報が必須であること" do
      @item.product_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end
    it "発送元の地域についての情報が必須であること"do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
    it "発送までの日数についての情報が必須であること" do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it "価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = "３８５"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "価格の範囲が、¥9,999,999以下であること" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end
    it "価格の範囲が、¥300以上であること" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "product_condition_idは1では保存できない" do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition must be other than 1")
    end
    it "shipping_charge_idは1では保存できない" do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
    it "shipping_area_idは1では保存できない" do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end
    it "shipping_day_idは1では保存できない" do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end
    it "category_idは1では保存できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
  end
end