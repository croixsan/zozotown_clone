class AddItemNumIdToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :item_num_id, :integer, foreign_key: true, null: false
    remove_column :stocks, :item_num, :integer
  end
end
