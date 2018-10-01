class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.integer :price, null: false
      t.integer :stock, null: false
      t.string :size, null: false
      t.string :gender, null: false
      t.text :description
      t.integer :top_category_id, null: false, foreign_key: true
      t.integer :sub_category_id, null: false, foreign_key: true
      t.integer :coupon_id, null: false, foreign_key: true
      t.integer :brand_id, null: false, foreign_key: true
      t.integer :shop_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
