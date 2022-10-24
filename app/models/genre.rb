class Genre < ApplicationRecord
  has_many :items
  belongs_to :admin
  validates :name, presence: true
end
