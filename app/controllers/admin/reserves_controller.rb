class Admin::ReservesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reserves = current_admin.reserves.page(params[:page])
  end

  def show
    @reserve = Reserve.find(params[:id])
  end

  def update
    @reserve = Reserve.find(params[:id])
    @reserve.update(reserve_params)
    redirect_to admin_reserves_path, notice: "来店ステータスを更新しました"
  end

  private
    def reserve_params
      params.require(:reserve).permit(:visit_status)
    end
end
