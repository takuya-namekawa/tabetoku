class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :orders
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def active_for_authentication?
    super && (is_active == true)
  end

  with_options presence: true do
  validates :name
  validates :name_kana
  validates :phone_number
  validates :email
  end

end
