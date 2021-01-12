class Public::CartItemsController < ApplicationController
  def index
    @item = Item.all
    @sum = 0
  end

  def update
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
