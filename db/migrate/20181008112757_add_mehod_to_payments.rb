class AddMehodToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :method, :string, null: false
    add_column :payments, :price, :integer, null: false
    add_column :payments, :point_rate, :float, null: false
  end
end
