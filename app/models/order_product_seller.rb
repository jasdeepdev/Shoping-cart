class OrderProductSeller < ApplicationRecord
  belongs_to :order
  belongs_to :product_seller
end
