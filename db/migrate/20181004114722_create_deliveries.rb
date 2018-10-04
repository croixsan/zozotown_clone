class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :addless, null: false
      t.integer :post_num, null: false
      t.integer :phone_num, null:false
      t.integer :kind, null: false
      t.timestamps
    end
  end
end
