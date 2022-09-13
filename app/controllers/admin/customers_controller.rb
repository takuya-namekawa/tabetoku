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

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :phone_number, :email, :is_active)
  end
end
