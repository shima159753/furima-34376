class AddOrderIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :buyers, :order, null: false, foreign_key: true
  end
end
