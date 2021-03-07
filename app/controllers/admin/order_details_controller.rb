class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
      if @order_detail.making_status ==  "製作完了"#製作ステータスが全て製作完了なら
        @order_detail.order.update(status: 4) #注文ステータスを発送済み
      end
    flash[:notice] = "製作ステータスを更新しました"
    redirect_to admin_order_path(@order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
