class Item < ApplicationRecord
  belongs_to :shop, counter_cache: :items_count
  belongs_to :brand, counter_cache: :items_count
  belongs_to :top_category
  belongs_to :sub_category
  belongs_to :coupon

  has_many :stocks
  has_many :images
  has_many :item_nums
  # has_many :shoppings, dependent: :destroy
  has_many :carts, through: :shoppings
  # has_many :ordered_items
  # has_many :orders, through: :ordered_items
  has_many :checked_items, dependent: :destroy
  # has_many :favorite_items

  # enum gender: {all: 1, mens: 2, ladies: 3, kids: 4}
end
