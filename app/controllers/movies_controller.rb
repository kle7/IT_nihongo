class MoviesController < ApplicationController
  before_action :find_movie, only: :show
  
  def show
    @rate = Rate.new
    @votes = Rate.votes
  end
  
  def find_movie
    @movie = Movie.find_by id: params[:id]
    if @movie.nil?
      flash[:danger] = t "genre.empty"
      redirect_to admin_root_path
    end
  end
end
