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

  def create
    # お気に入りレコードの作成
    @favorite = current_customer.favorites.new
    @favorite.admin_id = params[:admin_id]
    @favorite.save
    # 通知の作成
    @favorite.create_notification_by(current_customer)
    # viewのレンダー
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  private
    def set_admin
      @admin = Admin.find(params[:admin_id])
    end
end
