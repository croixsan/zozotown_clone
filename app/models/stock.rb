class Stock < ApplicationRecord
  belongs_to :item
  belongs_to :item_num
  enum size: ["", :S, :M, :L, :O]
end
