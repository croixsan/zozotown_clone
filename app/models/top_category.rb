class TopCategory < ApplicationRecord
  has_many :items
  has_many :sub_categories
end
