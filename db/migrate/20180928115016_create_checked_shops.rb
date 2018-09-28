class CreateCheckedShops < ActiveRecord::Migration[5.0]
  def change
    create_table :checked_shops do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :shop_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
