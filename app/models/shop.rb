class Shop < ApplicationRecord
  has_many :items
  has_many :checked_shops
  has_many :favorite_shops
  enum gender: {all: 1, mens: 2, ladies: 3, kids: 4}
end
