class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer), notice: "会員情報を更新しました"
  end

  def out
    @customer = Customer.find(params[:customer_id])
    @customer.update(is_active: false)

    redirect_to my_page_admin_admins_path, notice: "会員を退会させました"
  end

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :phone_number, :email, :is_active)
  end
end
