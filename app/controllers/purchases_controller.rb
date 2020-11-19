class PurchasesController < ApplicationController

  before_action :find_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :to_index, only: [:only, :create]
  before_action :move_to_index, only: [:index, :create]
  

  def index
    @user_purchase = UserPurchase.new
  end
  
  def create
    @user_purchase = UserPurchase.new(purchase_params)
      if @user_purchase.valid?
        pay_item
        @user_purchase.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def to_index
    if @item.purchase != nil
      redirect_to root_path
    end 
  end

  def move_to_index
    unless user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def purchase_params
    params.require(:user_purchase).permit(:post_number, :shipping_area_id, :city, :street_address, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )

  end
end
