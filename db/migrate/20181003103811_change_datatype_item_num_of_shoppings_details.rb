class ChangeDatatypeItemNumOfShoppingsDetails < ActiveRecord::Migration[5.0]
  def change
    change_column :shoppings_details, :item_num, :string
  end
end
