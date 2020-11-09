class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item, :image).permit(:product_name, :product_description, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :shipping_days_id, :price, user_id: current_user.id)
  end
end
