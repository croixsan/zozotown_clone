class ItemNum < ApplicationRecord
  belongs_to :item
  has_one :stock
end
