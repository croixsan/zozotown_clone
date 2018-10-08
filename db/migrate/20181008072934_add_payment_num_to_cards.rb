class AddPaymentNumToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :payment_num, :string
  end
end
