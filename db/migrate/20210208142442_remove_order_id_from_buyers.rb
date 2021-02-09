class RemoveOrderIdFromBuyers < ActiveRecord::Migration[6.0]
  def change
    remove_column :buyers, :order_id, :refrences
  end
end
