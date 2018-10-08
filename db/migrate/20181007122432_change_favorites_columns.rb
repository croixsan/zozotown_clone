class ChangeFavoritesColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :favorite_items, :item_num_id, :integer, foreign_key: true, null: false
    remove_column :favorite_items, :item_id, :integer
  end
end
