class AddKeyToFinalOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :final_orders, :user, foreign_key: true
  end
end
