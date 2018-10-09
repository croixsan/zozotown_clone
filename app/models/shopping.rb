class Shopping < ApplicationRecord
  belongs_to :item, counter_cache: :shoppings_count
  belongs_to :cart
  belongs_to :item_num
end
