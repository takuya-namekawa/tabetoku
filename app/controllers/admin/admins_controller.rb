class Admin::AdminsController < ApplicationController
  def show
    @admin = current_admin
  end

  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin
    if @admin.update(admin_params)
      redirect_to my_page_admins_path
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :address, :phone_number, :email, :home_page)
  end
end
