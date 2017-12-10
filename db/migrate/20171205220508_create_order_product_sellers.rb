class CreateOrderProductSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :order_product_sellers do |t|
      t.references :order, foreign_key: true
      t.references :product_seller, foreign_key: true

      t.timestamps
    end
  end
end
