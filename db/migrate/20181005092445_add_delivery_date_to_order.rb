class AddDeliveryDateToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_date, :datetime
    add_column :orders, :payment, :string
    add_column :orders, :payment_num, :integer
    add_column :orders, :card_id, :integer
  end
end
