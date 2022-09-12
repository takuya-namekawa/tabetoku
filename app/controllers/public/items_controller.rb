class Public::ItemsController < ApplicationController
  before_action :set_search, only: [:index, :search]

  def index
    @items = Item.all
    @genres = Genre.all


  end

  def show
    @item = Item.find(params[:id])
    @cart_item = @item.cart_items
    @item_inventory = []  #item_inventoryとして定義し商品の在庫数からしかカートに入れられないようにする処理
    for i in 1..@item.inventory
      @item_inventory.push(i)
    end
    @item_comment = ItemComment.new
   
  end

  def genre_items
    @genres = Genre.all
    @genre = Genre.find(params[:item_id])
    @genre_items = @genre.items.all
  end

  def search
    @results = @search.result
  end

  private

  def set_search
    @search = Item.ransack(params[:q])
  end


  def item_params
    params.require(:item).permit(:genre_id, :admin_id, :name, :explanation, :half_price, :price, :inventory, :is_ordered, :profile_image)
  end
end
