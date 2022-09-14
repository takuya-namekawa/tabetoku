class Admin::CustomersController < ApplicationController

  def show
    @customer =Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end

  def out
    @customer = Customer.find(params[:customer_id])
    @customer.update(is_active: false)

    redirect_to my_page_admin_admins_path
  end

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :phone_number, :email, :is_active)
  end
end
