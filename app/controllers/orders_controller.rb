class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :sold_move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new
  end

  def create
   @item = Item.find(params[:item_id])
   @order_buyer =OrderBuyer.new(order_params)
   if @order_buyer.valid?
    Payjp.api_key = "sk_test_7da02b43f9bc82acc3822229"
    Payjp::Charge.create(
     amount: @item.price,
     card: params[:token],
     currency: "jpy"
    )
    @order_buyer.save
    redirect_to root_path
   else
    render :index
   end
  end

  private

  def order_params
    params.require(:order_buyer).permit(:postal_code, :delivery_area_id, :city, :address, :building_name,:tel).merge(user_id: current_user.id, item_id: params[:item_id],order_id: params[:order_id],token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_move_to_index
    @item = Item.find(params[:item_id])
    if @item.order != nil
      redirect_to root_path 
    end
  end

end