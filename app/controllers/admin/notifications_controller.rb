class Admin::NotificationsController < ApplicationController
  def index
    @notifications = current_admin.passive_notifications
    @notifications.where(checked: false).each do |notification|
    notification.update_attributes(checked: true)
  end
  end

  def new_mail
    @notifications = current_admin.passive_notifications
    @notice_record = @notifications.find(params[:notification_id])
  end

  def send_mail
    @notifications = current_admin.passive_notifications
    @notice_record = @notifications.find(params[:notification_id])
    @shop_info_mail = ShopInfoMail.new(title: params[:mail_title], content: params[:mail_content])
    @mail_title = @shop_info_mail.title
    @mail_content = @shop_info_mail.content
    if @shop_info_mail.valid?
      ContactMailer.send_mail(@mail_title, @mail_content, @notice_record).deliver
    else
      flash.now[:alert] = "不正な入力です。"
      render "admin/notifications/new_mail"
    end
  end
end
