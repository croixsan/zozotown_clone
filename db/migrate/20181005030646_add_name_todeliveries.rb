class AddNameTodeliveries < ActiveRecord::Migration[5.0]
  def change
    add_column :deliveries, :name, :string
  end
end
