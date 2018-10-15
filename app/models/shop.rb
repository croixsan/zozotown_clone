class Shop < ApplicationRecord
  has_many :items
  has_many :checked_shops
  has_many :favorite_shops
  has_one :coupon
  # enum gender: {mens: 1, ladies: 2, kids: 3, all: 4}
end
