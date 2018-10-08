class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|

      t.timestamps
    end
  end
end
