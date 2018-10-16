class CreatePreOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :pre_orders do |t|
      t.integer :user_id, null: false, index: true, foreign_key: true
      t.integer :delivery_id, null: false, foreign_key: true
      t.integer :payment_id, null: false, foreign_key: true
      t.datetime :hope_day
      t.integer :hope_hour
      t.timestamps
    end
  end
end
