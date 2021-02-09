class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new
  end

  def create
   @item = Item.find(params[:item_id])
   @order_buyer =OrderBuyer.new(order_params)
   if @order_buyer.valid?
    @order_buyer.save
    redirect_to root_path
   else
    render :index
   end
  end

  def order_params
    params.require(:order_buyer).permit(:postal_code, :delivery_area_id, :city, :address, :building_name,:tel).merge(user_id: current_user.id, item_id: params[:item_id],order_id: params[:order_id])
  end

end
#order_id: params[:order_id]