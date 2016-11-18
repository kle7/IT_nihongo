class MoviesController < ApplicationController
  before_action :find_movie, only: :show
  
  def show
    @rate = Rate.new
    @votes = Rate.votes
    @genre = @movie.genres.first
    @same_genre_movie = @genre.movies.sample
  end
  
  def find_movie
    @movie = Movie.find_by id: params[:id]
    if @movie.nil?
      flash[:now][:danger] = t "genre.empty"
      redirect_to admin_root_path
    end
  end
end
