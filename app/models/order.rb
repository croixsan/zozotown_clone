class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  belongs_to :payment
  has_many :ordered_items, dependent: :destroy
  has_many :items, through: :ordered_items
  has_many :item_nums, through: :ordered_items
  enum delivery_hour: {"午前中": 1, "14:00〜16:00": 2, "16:00〜18:00": 3, "18:00〜20:00": 4}
end
