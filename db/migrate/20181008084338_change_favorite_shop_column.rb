class ChangeFavoriteShopColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :favorite_shops, :brand_id, :shop_id
  end
end
