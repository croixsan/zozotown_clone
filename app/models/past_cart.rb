class PastCart < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :item
  belongs_to :item_num
end
