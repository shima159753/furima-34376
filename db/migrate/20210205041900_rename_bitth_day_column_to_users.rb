class RenameBitthDayColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :birth_day, :birth_day
  end
end
