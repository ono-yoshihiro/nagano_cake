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
    @editgenre.update(genre_params)
    redirect_to '/admin/genres'
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end