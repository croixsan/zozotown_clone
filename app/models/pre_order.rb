class PreOrder < ApplicationRecord
  belongs_to :payment
  belongs_to :delivery
  belongs_to :user
end
