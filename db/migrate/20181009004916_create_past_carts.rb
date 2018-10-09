class CreatePastCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :past_carts do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :cart_id, null: false, foreign_key: true
      t.integer :item_id, null: false, foreign_key: true
      t.integer :item_num_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
