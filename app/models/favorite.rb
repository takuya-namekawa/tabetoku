class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :admin
  has_many :notifications, dependent: :destroy
  validates_uniqueness_of :admin_id, scope: :customer_id

  def create_notification_by(current_customer)

    notification = current_customer.active_notifications.new(
      favorite_id: id,
      visited_id: admin_id,
      action: "favorite"
    )
    notification.save if notification.valid?
  end

end
