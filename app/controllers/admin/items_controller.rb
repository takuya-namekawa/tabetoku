class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index

    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.admin_id = current_admin.id
    @item.save!
    redirect_to  admin_items_path
  end

  def edit

    @item = Item.find(params[:id])
  end

  def update

     @item = Item.find(params[:id])
     @item.update(item_params)
     redirect_to   admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :admin_id, :name, :explanation, :half_price, :price, :inventory, :is_ordered, :profile_image)
  end

end
