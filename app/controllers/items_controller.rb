class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item)
      .permit(:product_name, :category_id, :price, :product_status_id, :burden_id, :area_id, :days_id, :description, :user, :image)
      .merge(user_id: current_user)
  end
end
