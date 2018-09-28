class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false, index: true, unique: true
      t.string :url
      t.string :gender, null: false
      t.timestamps
    end
  end
end
