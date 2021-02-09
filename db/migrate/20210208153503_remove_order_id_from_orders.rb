class RemoveOrderIdFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :order_id, null: false, foreign_key: true
  end
end
