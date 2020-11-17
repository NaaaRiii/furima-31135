class PurchasesController < ApplicationController
  def index
    @item = Item.new
    @purchase = Purchase.new
  end

  def new
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
      if @user_purchase.valid?
        @user_purchase.save
        return redirect_to action: :index
      else
        render :new
      end
      # @user = User.create(user_params)
      # Address.create(address_params(@user))
      # Purchase.create(donation_params(@user))
      # redirect_to action: :index
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:nickname, :price, :user, :item, :post_number, :prefecture_id, :city, :street_adress, :building, :phone_number, :purchase)
  end
end
