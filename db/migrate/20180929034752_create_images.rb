class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.string :url, null: false
      t.timestamps
    end
  end
end
