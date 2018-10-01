class Brand < ApplicationRecord
  has_many :items
  has_many :favorite_brands
  enum gender: {mens: 1, ladies: 2, kids: 3, all: 4}
end
