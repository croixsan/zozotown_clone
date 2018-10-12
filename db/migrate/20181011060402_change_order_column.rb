class ChangeOrderColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :buy_date, :datetime
    remove_column :orders, :delivery_kind, :integer
    remove_column :orders, :card_id, :integer
    remove_column :orders, :cart_id, :integer

    change_column :orders, :delivery_day, :datetime
    change_column :orders, :delivery_hour, :integer

    add_column :orders, :used_point, :integer, null: false, default: 0
    add_column :orders, :coupon_id, :integer, null: false, foreign_key: true
    add_column :orders, :order_num, :string, null: false

    add_column :ordered_items, :number, :integer, null: false

    change_column :users, :post_num, :string

    add_column :users, :card_num, :string
    add_column :users, :security_code, :integer

  end
end
