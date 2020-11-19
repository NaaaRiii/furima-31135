# require 'rails_helper'

# RSpec.describe Purshase, type: :model do
#   before do
#     @purchase = FactoryBot.build(:purchase)
#   end

#   it "tokenがあれば保存ができること" do
#     expect(@purchase).to be_valid
#   end

#   # it "priceが空では登録できないこと" do
#   #   @order.price = nil
#   #   @order.valid?
#   #   expect(@order.errors.full_messages).to include("Price can't be blank")
#   # end

#   it "tokenが空では登録できないこと" do
#     @purchase.token = nil
#     @purchase.valid?
#     expect(@purchase.errors.full_messages).to include("Token can't be blank")
#   end
# end