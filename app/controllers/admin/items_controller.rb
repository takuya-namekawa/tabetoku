class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.admin_id = current_admin.id
    if @item.save
      redirect_to admin_items_path, notice: "商品を新しく登録しました"
    else
      @admin = current_admin
      @genre = Genre.new
      @genres = Genre.all
      render "admin/admins/show"
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @item.admin != current_admin
      redirect_to root_path, alert: "不正なアクセスです"
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to   admin_items_path, notice: "商品情報を更新しました"
    else
      render "admin/items/edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path, notice: "商品を削除しました"
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :admin_id, :name, :explanation, :half_price, :price, :inventory, :is_ordered, :profile_image)
    end
end
