class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
