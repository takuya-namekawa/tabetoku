class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :reserves, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_one_attached :profile_image

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no-image.png')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end


  with_options presence: true do
  validates :name
  validates :address
  validates :phone_number
  validates :email
  end

  def self.guest
    find_or_initialize_by(email: 'guest@guest.com') do |admin|
      admin.attributes = { password: SecureRandom.urlsafe_base64 ,
                           name: "guestadmin",
                           address: "guestaddress",
                           phone_number: "0" }
      admin.save
    end
  end
end
