class OrderedItem < ApplicationRecord
  belongs_to :item, counter_cache: :ordered_items_count
  belongs_to :order
end
