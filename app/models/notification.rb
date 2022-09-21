class Notification < ApplicationRecord
  # スコープ(新着順)
  default_scope -> { order(created_at: :desc) }

  belongs_to :favorite, optional: true
  belongs_to :visiter, class_name: "Customer", foreign_key: "visiter_id", optional: true
  belongs_to :visited, class_name: "Admin", foreign_key: "visited_id", optional: true

  def customer
    # Notification.customerときた場合、ユーザー情報を返す
    Customer.find(visiter_id)
  end
end
