class Delivery < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one :pre_order
end
