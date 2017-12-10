class CreateProductSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :product_sellers do |t|
      t.string :pro_name
      t.integer :price
      t.integer :units

      t.timestamps
    end
  end
end
