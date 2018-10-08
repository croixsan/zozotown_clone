class ChangeBuyDateToOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :card_id, :integer, foreign_key: true
  end
end
