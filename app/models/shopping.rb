class Shopping < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :item_num
end
