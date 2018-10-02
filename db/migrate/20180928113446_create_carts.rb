class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :total_price, default: 0
      t.timestamps
    end
  end
end
