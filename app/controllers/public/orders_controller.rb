class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!

  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
    @cart_items = current_end_user.cart_items
    @order = Order.new(order_params)
    @sum = 0
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = current_end_user.orders
  end

  def show
  end


  private
   def order_params
    params.permit(:post_code, :name, :address)
   end
end
