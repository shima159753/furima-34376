class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :delivery_fee_id, :delivery_area_id, :delivery_days_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
