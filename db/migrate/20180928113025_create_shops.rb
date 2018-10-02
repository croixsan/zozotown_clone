class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false, index: true, unique: true
      t.text :concept
      t.string :url
      t.string :gender, null: false
      t.string :logo
      t.timestamps
    end
  end
end
