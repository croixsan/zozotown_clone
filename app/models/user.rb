class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # enum gender: { men: 1, women: 2, other: 3 }
  has_one :pre_order, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :checked_items, dependent: :destroy
  has_many :checked_shops
  has_many :favorite_items, dependent: :destroy
  has_many :favorite_brands
  has_many :favorite_shops
  has_many :orders
  has_many :past_carts, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :post_num, length: { maximum: 7 }
  validates :phone_num, length: { maximum: 11 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
