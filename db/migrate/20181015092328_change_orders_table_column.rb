class ChangeOrdersTableColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :coupon_id, :integer
    add_column :orders, :coupon, :integer
  end
end
