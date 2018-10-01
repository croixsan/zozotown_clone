class Cart < ApplicationRecord
  belongs_to :user
  has_many :shoppings
  has_many :items, through: :shoppings
end
