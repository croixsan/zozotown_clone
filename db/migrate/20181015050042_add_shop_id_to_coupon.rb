class AddShopIdToCoupon < ActiveRecord::Migration[5.0]
  def change
    add_column :coupons, :shop_id, :integer, null: false, foreign_key: true
  end
end
