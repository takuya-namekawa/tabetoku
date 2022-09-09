class Public::HomesController < ApplicationController

  def top
    @items = Item.all.order(created_at: :desc)
    @genres = Genre.all
  end
  
   def genre_items
    @genres = Genre.all
    @genre = Genre.find(params[:item_id])
    @genre_items = @genre.items.all
  end  

end
