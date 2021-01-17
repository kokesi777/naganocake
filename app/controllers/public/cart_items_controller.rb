class Public::CartItemsController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @cart_items = current_end_user.cart_items
    @sum = 0  #初期設定
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def create
    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.update(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
		@cart_item.destroy
    redirect_to cart_items_path, notice: '削除しました'
  end

  def destroy_all
    @cart_items = current_end_user.cart_items
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カートを空にしました'
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :end_user_id)
  end

end
