class ChangeUserColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :phone_num, :string, null: true
    change_column :users, :address, :string, null: true
  end
end
