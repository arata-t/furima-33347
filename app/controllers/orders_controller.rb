class OrdersController < ApplicationController
  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:item_order)
    .permit(:postal_code, :area_id, :city, :house_num, :building_name, :phone, :item_id)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: Item.find(params[:item_id]).price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
