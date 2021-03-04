class OrdersController < ApplicationController
  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:postal_code, :area_id, :city, :house_num, :building_name, :phone, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
