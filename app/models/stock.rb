class Stock < ApplicationRecord
  belongs_to :item
  belongs_to :item_num
  enum size: [:XS, :S, :M, :L, :XL, :FREE, :free]
end
