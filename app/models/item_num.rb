class ItemNum < ApplicationRecord
  belongs_to :item
  has_one :stock
  has_many :shoppings
  has_many :carts, through: :shoppings
  has_many :favorite_items
end
