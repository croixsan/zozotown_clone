class AddDefault0 < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :point, :integer, defalut: 0
  end
end
