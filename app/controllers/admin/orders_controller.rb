class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(prder_params)
    #if @order.order_status == "入金確認" #注文ステータスが入金確認なら下の事をする
        #@order_items.update_all(making_status: 1) #製作ステータスを「製作待ちに」　更新
      #end
    redirect_to admin_order_path
  end


  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
