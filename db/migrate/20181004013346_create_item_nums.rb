class CreateItemNums < ActiveRecord::Migration[5.0]
  def change
    create_table :item_nums do |t|
      t.string :item_num, null: false
      t.integer :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
