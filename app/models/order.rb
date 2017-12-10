class Order < ApplicationRecord
	has_and_belongs_to_many :product_seller, :join_table => 'order_product_sellers'
	belongs_to :user
	#belongs_to :final_order_list, dependent: :destroy

end
