class Cart < ApplicationRecord
  belongs_to :user
  has_many :shoppings
  has_many :items, through: :shoppings
  has_many :item_nums, through: :shoppings
  belongs_to :order
end
