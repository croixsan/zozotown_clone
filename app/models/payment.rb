class Payment < ApplicationRecord
  has_one :pre_order
  has_one :order
end
