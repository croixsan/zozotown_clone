class DeleteTypeColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :deliveries, :type, :string
    add_column :deliveries, :kind, :string, null: false
  end
end
