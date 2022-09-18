class ContactMailer < ApplicationMailer

  def send_mail(mail_title, mail_content, notice_record) #メソッドに対して引数を設定
  @mail_title = mail_title
  @mail_content = mail_content
  mail bcc: notice_record.customer.email, subject: mail_title
  end

end
