module Admin::NotificationsHelper

  def notification_form(notification)
    @visiter = notification.visiter
    case notification.action
    when "favorite" then
        tag.a(notification.visiter.name, href:admin_customer_path(@visiter), style:"font-weight: bold;")+"様が"+tag.a('あなたのお店', href:my_page_admin_admins_path(notification.visited_id), style:"font-weight: bold;")+"をお気に入りリストに追加しました"
    end
  end

end
