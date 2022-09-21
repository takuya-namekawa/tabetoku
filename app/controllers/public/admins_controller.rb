class Public::AdminsController < ApplicationController
  before_action :set_search, only: [:index, :search]

  def index
    @admins = Admin.page(params[:page])
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

  def search
    @results = @search.result
  end

  private
    def set_search
      @search = Item.ransack(params[:q])
    end

    def event_params
      params.require(:event).permit(:title, :content, :address, :latitude, :longitude)
    end
end
