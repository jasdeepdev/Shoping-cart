class AddAttachmentAvatarToProductSellers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :product_sellers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :product_sellers, :avatar
  end
end
