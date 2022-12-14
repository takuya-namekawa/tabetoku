class Item < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :item_comments, dependent: :destroy
  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no-image.png")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name, presence: true
  validates :explanation, presence: true
  validates :half_price, presence: true, numericality: {only_integer: true}
  validates :price, presence: true, numericality: {only_integer: true}
  validates :inventory, presence: true, numericality: {only_integer: true}

  scope :top, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
end
