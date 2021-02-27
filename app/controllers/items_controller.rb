class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :redirect, only: [:edit, :update]
  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    redirect_to root_path if item.destroy
  end

  private

  def item_params
    params.require(:item)
          .permit(:product_name, :category_id, :price, :product_status_id, :burden_id, :area_id, :days_id, :description, :image)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect
    redirect_to action: :index unless current_user.id == @item.user.id
  end
end
