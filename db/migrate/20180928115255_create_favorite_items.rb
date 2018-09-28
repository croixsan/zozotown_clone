class CreateFavoriteItems < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_items do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
