class RemovePaymentNumToOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :payment_num, :integer
  end
end
