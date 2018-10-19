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

  validates :post_num, length: { is: 7 }, numericality: {only_integer: true}
  validates :phone_num, length: { in: 10..11 }, on: :update

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  # VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  # validates :password, length: { in: 8..12 }, format: { with: VALID_PASS_REGEX}, if: :password_form?

  # def password_form?
  #   params[:title] == "password"
  # end
end
