class AddTopCategoryIdToSubCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :sub_categories, :top_category_id, :integer, foreign_key: true
  end
end
