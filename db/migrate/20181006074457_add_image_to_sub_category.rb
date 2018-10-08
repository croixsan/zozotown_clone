class AddImageToSubCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :sub_categories, :image, :string
  end
end
