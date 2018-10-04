class Stock < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  enum size: ["", :S, :M, :L, :O]
end
