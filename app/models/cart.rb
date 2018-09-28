class Cart < ApplicationRecord
  belongs_to :user
  has_many :shoppings
  has many :items, through: shoppings
end
