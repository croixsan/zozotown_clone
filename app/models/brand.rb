class Brand < ApplicationRecord
  has_many :items
  has_many :favorite_brands
  enum gender: {all: 1, mens: 2, ladies: 3, kids: 4}
end
