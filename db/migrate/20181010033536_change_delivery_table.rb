class ChangeDeliveryTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :deliveries, :user_id, :integer
    remove_column :deliveries, :addless, :string
    remove_column :deliveries, :post_num, :integer
    remove_column :deliveries, :phone_num, :integer
    remove_column :deliveries, :kind, :integer
    remove_column :deliveries, :name, :string
    add_column :deliveries, :type, :string, null: false
    add_column :deliveries, :price, :integer, null: false    
  end
end
