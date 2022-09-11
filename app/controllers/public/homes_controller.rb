class Public::HomesController < ApplicationController
  before_action :set_search, only: [:index, :search, :top]

  def top
    @items = Item.all.order(created_at: :desc)
    @genres = Genre.all
    @admins = Admin.all
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

end
