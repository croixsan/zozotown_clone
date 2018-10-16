class CheckedItem < ApplicationRecord
  belongs_to :user
  belongs_to :item, counter_cache: :checked_items_count
end
