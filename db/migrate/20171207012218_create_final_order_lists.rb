class CreateFinalOrderLists < ActiveRecord::Migration[5.1]
  def change
    create_table :final_order_lists do |t|
      t.string :pro_name
      t.integer :price
      t.integer :units

      t.timestamps
    end
  end
end
