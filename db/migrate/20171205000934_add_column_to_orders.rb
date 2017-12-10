class AddColumnToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :units, :integer
  end
end
