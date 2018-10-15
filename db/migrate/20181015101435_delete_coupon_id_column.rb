class DeleteCouponIdColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :coupon_id, :integer
  end
end
