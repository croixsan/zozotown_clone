class ChangeDeliveryDateToOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :delivery_date, :datetime, null: false
    change_column :orders, :payment, :string, null: false
    change_column :orders, :payment_num, :integer, null: false
    change_column :orders, :card_id, :integer, null: false
    change_column :orders, :delivery_id, :integer, null: false
  end
end
