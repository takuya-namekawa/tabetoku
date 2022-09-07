class Admin::ReservesController < ApplicationController
  def index

    @reserves = current_admin.reserves.all
    # @order = Order.customer.find_by(customer_id: customer_id)
  end

  def show
    @reserve = current_admin.reserves.find(params[:id])
  end


end
