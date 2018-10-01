class ChangeItemsColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :stock
    remove_column :items, :size
    change_column :items, :gender, :integer
  end
end
