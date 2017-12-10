class AddKeyToFinalOrderList < ActiveRecord::Migration[5.1]
  def change
    add_reference :final_order_lists, :user, foreign_key: true
  end
end
