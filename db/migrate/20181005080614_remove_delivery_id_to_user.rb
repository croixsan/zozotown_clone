class RemoveDeliveryIdToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :delivery_id, :integer
  end
end
