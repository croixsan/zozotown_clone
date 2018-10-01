class AddItemNumToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :item_num, :string
  end
end
