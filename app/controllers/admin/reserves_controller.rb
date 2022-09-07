class Admin::ReservesController < ApplicationController
  def index
    pp current_admin
    @reserves = current_admin.reserves
  end

  def show
  end
end
