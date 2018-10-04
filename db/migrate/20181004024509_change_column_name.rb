class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    remove_column :item_nums, :item_num, :string
    add_column :item_nums, :number, :string, null: false
  end
end
