class AddDeliveryKindToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_kind, :integer, null: false
    add_column :orders, :delivery_day, :string
    add_column :orders, :delivery_hour, :string
    add_column :orders, :payment_id, :integer, foreign_key: true
    remove_column :orders, :delivery_date, :string, null: false
    remove_column :orders, :payment, :string, null: false
  end
end
