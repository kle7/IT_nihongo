class GenresController < ApplicationController
  before_action :find_genre
  
  def show
    @movies = @genre.movies.page(params[:page]).per 8
  end

  def find_genre
    @genre = Genre.find_by id: params[:id]
    if @genre.nil?
      flash[:now][:danger] = t "user.empty"
      redirect_to admin_root_path
    end
  end
end
