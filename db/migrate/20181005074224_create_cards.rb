class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :number, null: false
      t.integer :limit_year, null: false
      t.integer :limit_month, null: false
      t.integer :security_code, null: false
      t.timestamps
    end
  end
end
