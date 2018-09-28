class CreateShoppings < ActiveRecord::Migration[5.0]
  def change
    create_table :shoppings do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.integer :cart_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
