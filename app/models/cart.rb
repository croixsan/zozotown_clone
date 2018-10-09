class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :order

  has_many :shoppings
  has_many :items, through: :shoppings
  has_many :item_nums, through: :shoppings
  has_many :past_carts, dependent: :destroy
end
