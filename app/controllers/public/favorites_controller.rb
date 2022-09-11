class Public::FavoritesController < ApplicationController
  before_action :set_admin
  before_action :authenticate_customer!

  # お気に入り登録
  def create
    @favorite = Favorite.create(customer_id: current_customer.id, admin_id: @admin.id)
  end
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, admin_id: @admin.id)
    @favorite.destroy
  end

  private
  def set_admin
    @admin = Admin.find(params[:admin_id])
  end
end
