class Admin::CustomersController < ApplicationController
  def show

    @customer =Customer.find(params[:id])
    #find_by(name: xxx)

    #@customer.reserve = @customer
    #@admin_reserve = @customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :phone_number, :email, :is_active)
  end
end
