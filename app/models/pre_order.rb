class PreOrder < ApplicationRecord
  belongs_to :payment
  belongs_to :delivery
  belongs_to :user
  enum hope_hour: {"午前中": 1, "14:00〜16:00": 2, "16:00〜18:00": 3, "18:00〜20:00": 4}
end
