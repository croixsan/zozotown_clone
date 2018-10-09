class DeleteColumnFromPastCarts < ActiveRecord::Migration[5.0]
  def change
    remove_column :past_carts, :cart_id, :integer
    remove_column :past_carts, :item_id, :integer
  end
end
