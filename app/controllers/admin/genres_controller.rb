class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @newgenre = Genre.new
  end

  def create
    @newgenre = Genre.new(genre_params)
    @newgenre.save
    redirect_to '/admin/genres'
  end

  def edit
    @editgenre = Genre.find(params[:id])
  end

  def update
    @editgenre = Genre.find(params[:id])
    if @editgenre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end