class CreateShoppingsDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :shoppings_details do |t|

      t.integer :cart_id, foreign_key: true
      t.integer :item_num

      t.timestamps
    end
  end
end
