class Item < ApplicationRecord
  belongs_to :shop, counter_cache: :items_count
  belongs_to :brand, counter_cache: :items_count
  belongs_to :top_category
  belongs_to :sub_category

  has_many :stocks, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :item_nums, dependent: :destroy
  has_many :shoppings, dependent: :destroy
  has_many :carts, through: :shoppings
  has_many :ordered_items, dependent: :destroy
  # has_many :orders, through: :ordered_items
  has_many :checked_items, dependent: :destroy
  has_many :favorite_items, dependent: :destroy
  # enum gender: {all: 1, mens: 2, ladies: 3, kids: 4}
end
