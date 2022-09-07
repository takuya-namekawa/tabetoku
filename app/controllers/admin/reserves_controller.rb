class Admin::ReservesController < ApplicationController
  def index
   
    @reserves = current_admin.reserves.all
  end

  def show
    @reserve = current_admin.reserves.find(params[:id])
  end
  
  
end
