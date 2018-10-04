class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_items
  has_many :items, through: :ordered_items
  has_one :delivery
end
