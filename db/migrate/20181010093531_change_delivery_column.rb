class ChangeDeliveryColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :deliveries, :type, :string, null: false
  end
end
