class Public::ReservesController < ApplicationController


  def confirm
    @reserve = Reserve.new
    @cart_items = current_customer.cart_items.all
  
  end

  def create
    cart_items = current_customer.cart_items.all
    @reserve = current_customer.orders.new(reserve_params)
    @reserve =  cart_items
    @reserve.save

    redirect_to thanks_path

  end

  def thanks
    current_customer.cart_items.destroy_all
  end

  def index
    @orders = current_customer.orders
  end
  private

  def reserve_params
    params.require(:reserve).permit( :customer_id, :admin_id,:visit,:total_payment,:payment_method,:visit_status)
  end


end
