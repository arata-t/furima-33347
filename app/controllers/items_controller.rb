class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end 
  end

  private
  def item_params
    params.require(:item)
      .permit(:product_name, :category_id, :price, :product_status_id, :burden_id, :area_id, :days_id, :description, :image)
      .merge(user_id: current_user.id)
  end
end
