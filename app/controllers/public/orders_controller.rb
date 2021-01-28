class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!

  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
    @cart_items = current_end_user.cart_items
    @order = Order.new
    if params[:address_num] == "1"
      @order.post_code = current_end_user.post_code
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name
    elsif params[:address_num] == "2"
      address = Address.find(params[:order][:address])
      @order.post_code = address.post_code
      @order.address = address.address
      @order.name = address.name
    elsif params[:address_num] == "3"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'new'
    end
      @sum = 0
  end

  def create
    @order = Order.new(order_params)
    @order.save
    current_end_user.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price = @order.total_payment
      @order_detail.save
    end
    redirect_to complete_path
    current_end_user.cart_items.destroy_all
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end


  private
   def order_params
    params.require(:order).permit(:post_code, :name, :address, :payment_method, :total_payment, :end_user_id)
   end
end
