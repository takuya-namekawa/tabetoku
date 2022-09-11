class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :admin

  validates_uniqueness_of :admin_id, scope: :customer_id
end
