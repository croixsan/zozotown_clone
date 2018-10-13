class AddTotalPriceColumnToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total_price, :integer, default: 0, null: false
  end
end
