class ItemNum < ApplicationRecord
  belongs_to :item
  has_one :stock
  has_many :shoppings
  has_many :carts, through: :shoppings
  has_many :favorite_items
  has_many :past_carts, dependent: :destroy
  has_many :ordered_items
  has_many :orders, through: :ordered_items
end
