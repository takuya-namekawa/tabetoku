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
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    ContactMailer.send_mail(@mail_title, @mail_content, @notice_record).deliver
  end
end
