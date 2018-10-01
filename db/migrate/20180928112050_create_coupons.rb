class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.integer :price, null: false, unique: true
      t.timestamps
    end
  end
end
