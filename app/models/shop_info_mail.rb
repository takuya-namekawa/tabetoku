class ShopInfoMail
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string
  attribute :content, :string

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
end