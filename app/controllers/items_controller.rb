class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_toppage, only: [:edit]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    else
      render :edit, status: :unprocessable_entity
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_explanation, :price, :category_id, :item_condition_id, :shipping_fee_burden_id, :prefecture_id, :delivery_time_id).merge(user: current_user)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_toppage
    redirect_to root_path if @item.order.present?
  end
end
