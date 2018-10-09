class PastCart < ApplicationRecord
  belongs_to :user
  belongs_to :item_num
end
