class AddCountToBrandsShops < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :items_count, :integer
    add_column :shops, :items_count, :integer
  end
end
