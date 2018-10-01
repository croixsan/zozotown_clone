class SubCategory < ApplicationRecord
  belongs_to :top_category
  has_many :items
end
