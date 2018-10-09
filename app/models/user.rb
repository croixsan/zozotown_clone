class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # enum gender: { men: 1, women: 2, other: 3 }
  has_one :cart, dependent: :destroy
  has_many :checked_items, dependent: :destroy
  has_many :checked_shops
  has_many :favorite_items, dependent: :destroy
  has_many :favorite_brands
  has_many :favorite_shops
  has_many :deliverys
  has_many :orders
  has_many :past_carts, dependent: :destroy
end
