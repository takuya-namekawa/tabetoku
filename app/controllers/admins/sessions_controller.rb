class Admins::SessionsController < Devise::SessionsController
  def guest_sign_in
    admin = Admin.guest
    sign_in admin
    redirect_to  my_page_admin_admins_path, notice: 'guestuserでログインしました。'
  end
end