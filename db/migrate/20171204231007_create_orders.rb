class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :pro_name
      t.integer :price

      t.timestamps
    end
  end
end
