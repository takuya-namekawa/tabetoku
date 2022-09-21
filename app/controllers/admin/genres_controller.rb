class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to my_page_admin_admins_path, notice: "ジャンルを新しく登録しました"
    else
      @admin = current_admin
      @item = Item.new
      @genres = Genre.all
      render "admin/admins/show"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to my_page_admin_admins_path, notice: "ジャンル名を更新しました"
    else
      render "admin/genres/edit"
    end
  end

private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
