class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
     @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to  my_page_admin_admins_path
    else
      @renres = Genre.all
      render 'index'
    end
  end

  def edit
     @genre = Genre.find(params[:id])
  end

  def update
      @genre = Genre.find(params[:id])
      @genre.update(genre_params)
      redirect_to my_page_admin_admins_path
  end

private


    def genre_params
      params.require(:genre).permit(:name)
    end
end
