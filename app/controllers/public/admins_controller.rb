class Public::AdminsController < ApplicationController
  def index
    @admins = Admin.all
    @genres = Genre.all
  end

  def genre_items
    @genres = Genre.all
    @genre = Genre.find(params[:item_id])
    @genre_items = @genre.items.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  private

  def event_params
     params.require(:event).permit(:title, :content, :address, :latitude, :longitude)
  end

end
