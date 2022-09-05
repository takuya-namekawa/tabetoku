class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = @item.cart_items
    @item_inventory = []  #item_inventoryとして定義し商品の在庫数からしかカートに入れられないようにする処理
    for i in 1..@item.inventory
      @item_inventory.push(i)
    end  
  end


  def item_params
    params.require(:item).permit(:genre_id, :admin_id, :name, :explanation, :half_price, :price, :inventory, :is_ordered, :profile_image)
  end
end
