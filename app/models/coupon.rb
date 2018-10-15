class Coupon < ApplicationRecord
  has_many :items
  has_many :orders
  belongs_to :shop
end
