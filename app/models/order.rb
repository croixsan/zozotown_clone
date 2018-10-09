class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_items
  has_many :items, through: :ordered_items
  has_one :delivery
  has_one :card, inverse_of: :order
  has_one :cart, inverse_of: :order

  # accepts_nested_attributes_for :delivery
  # accepts_nested_attributes_for :cards

  enum payment_id: [:nasi,:tuke, :zozo, :credit, :cash, :line, :lowson, :familymart, :sunkus, :circleK, :ministop, :daylyyamazaki, :seveneleven, :kuroneko]
end

