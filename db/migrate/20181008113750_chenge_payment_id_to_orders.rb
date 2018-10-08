class ChengePaymentIdToOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :payment_id, :integer, null: false, foreign_key: true
  end
end
