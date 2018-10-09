class AddCounterColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :favorite_items_count, :integer, default: 0
    add_column :items, :checked_items_count, :integer, default: 0
    add_column :items, :shoppings_count, :integer, default: 0
    add_column :items, :ordered_items_count, :integer, default: 0
    add_column :favorite_items, :item_id, :integer, foreign_key: true, null: false
  end
end
