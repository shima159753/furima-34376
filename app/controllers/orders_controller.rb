class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :item_params, only: [:index,:create,:move_to_index]

  def index
    @order_buyer = OrderBuyer.new
  end

  def create
   @order_buyer =OrderBuyer.new(order_params)
   if @order_buyer.valid?
    pay_item
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
    if current_user.id == @item.user_id  ||  @item.order != nil
      redirect_to root_path
    end
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: "jpy"
    )
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

end