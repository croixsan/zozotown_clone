class AddIndexToUserId < ActiveRecord::Migration[5.0]
  def change
    add_index :past_carts, :user_id
  end
end
