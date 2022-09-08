class Admin::ReservesController < ApplicationController
  def index
    @reserves = current_admin.reserves.all
    # @order = Order.customer.find_by(customer_id: customer_id)
  end

  def show
    #@reserve = current_admin.reserves.find(params[:id])
    @reserve = Reserve.find(params[:id])

  end

  def update
    # @reserve = current_admin.find(admin_id: admin_id)
    @reserve = Reserve.find(params[:id])
  
    @reserve.update(reserve_params)
    redirect_to admin_reserves_path
  end

  private

  def reserve_params
    params.require(:reserve).permit( :visit_status )
  end

end
