class AddBuyDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :buy_date, :datetime
  end
end
