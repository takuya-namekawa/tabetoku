class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @admin = current_admin
    @genre = Genre.new(genre_params)
    @genre.admin_id = @admin.id
    if @genre.save
      redirect_to my_page_admin_admins_path, notice: "ジャンルを新しく登録しました"
    else
      @admin = current_admin
      @item = Item.new
      @genres = @admin.genres
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

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to my_page_admin_admins_path, notice: "ジャンルを削除しました"
  end

private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
