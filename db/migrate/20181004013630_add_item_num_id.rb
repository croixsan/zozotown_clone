class AddItemNumId < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :item_num_id, :integer, foreign_key: true, null: false
    remove_column :stocks, :item_num_id, :integer

    add_column :shoppings, :item_num_id, :integer, foreign_key: true, null: false

    add_column :ordered_items, :item_num_id, :integer, foreign_key: true, null: false

    add_column :orders, :cart_id, :integer, foreign_key: true, null: false
 
  end
end
