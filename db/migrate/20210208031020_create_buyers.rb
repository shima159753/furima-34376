class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string  :postal_code,                  null: false
      t.integer :delivery_area_id,             null: false
      t.string  :city,                         null: false
      t.string  :address,                      null: false
      t.string  :building_name
      t.string  :tel,                          null: false
      t.references :item,                      null: false, foreign_key: true
      t.references :order,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
