class Delivery < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_one :pre_order
end
