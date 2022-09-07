class Admin::AdminsController < ApplicationController
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
      redirect_to my_page_admin_admins_path
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :address, :phone_number, :email, :home_page, :profile_image, :start_offer, :end_offer)
  end
end
