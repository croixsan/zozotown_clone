class DeleteGender < ActiveRecord::Migration[5.0]
  def change
    remove_column :top_categories, :gender, :integer
    remove_column :sub_categories, :gender, :integer
  end
end
