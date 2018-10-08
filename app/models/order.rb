class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_items
  has_many :items, through: :ordered_items
  has_one :delivery
  has_one :card
  has_one :cart

  enum payment: [:tuke, :zozo, :credit, :cash, :line, :lowson, :familymart, :sunkus, :circleK, :ministop, :daylyyamazaki, :seveneleven, :kuroneko]
end

