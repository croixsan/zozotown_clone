class AddDeliveryIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :delivery_id, :integer
  end
end
