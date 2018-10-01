class AddTypeToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :top_categories, :gender, :integer, null: false
    add_column :sub_categories, :gender, :integer, null: false
  end
end
