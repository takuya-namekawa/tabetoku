class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_guest_admin, only: [:edit]

  def show
    @admin = current_admin
    @item = Item.new
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin
    if @admin.update(admin_params)
      redirect_to my_page_admin_admins_path, notice: "お店の情報を更新しました"
    else
      render "admin/admins/edit"
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :address, :phone_number, :email, :home_page, :profile_image, :start_offer, :end_offer)
  end

  def ensure_guest_admin
    @admin = current_admin
    if @admin.name == "guestadmin"
      redirect_to  my_page_admin_admins_path , alert: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
