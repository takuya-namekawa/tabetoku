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
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy

  def active_for_authentication?
    super && (is_active == true)
  end

  with_options presence: true do
  validates :name
  validates :name_kana
  validates :phone_number
  validates :email
  end

  def self.guest
    find_or_create_by!(name: 'guestcustomer' ,email: 'guest@example.com' ,name_kana: 'ゲストカスタマー' ,phone_number: '0') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestcustomer"
    end
  end

end
