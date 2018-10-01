class CreateOrderedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_items do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.integer :order_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
