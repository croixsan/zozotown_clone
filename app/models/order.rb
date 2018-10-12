class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  belongs_to :payment
  belongs_to :coupon
  has_many :ordered_items, dependent: :destroy
  has_many :items, through: :ordered_items
end
