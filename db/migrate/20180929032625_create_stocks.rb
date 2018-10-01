class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.integer :stock, null: false
      t.integer :size, null: false
      t.string  :color, null: false
      t.timestamps
    end
  end
end
