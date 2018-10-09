class FavoriteItem < ApplicationRecord
  belongs_to :user
  belongs_to :item_num
  belongs_to :item, counter_cache: :favorite_items_count
end
