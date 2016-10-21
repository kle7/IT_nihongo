class Admin::MoviesController < Admin::BaseController
  before_action :find_movie, only: [:edit, :update, :destroy, :show]

  def new
    @movie = Movie.new
    @genres = Genre.all
  end
  
  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      flash[:success] = t "movie.created"
      redirect_to admin_movies_path
    else
      render :new
    end
  end

  def edit
    @genres = Genre.all
  end
  
  def show  
  end

  def destroy
    if @movie.destroy
      flash[:success] = t "movie.deleted"
    else
      flash[:danger] = t "flash.fail"
    end
    redirect_to admin_movies_path
  end

  def update
    if @movie.update movie_params
      flash[:success] = "success"
      redirect_to admin_movies_path
    else
      render :new
    end
  end

  private
  def movie_params
    params.require(:movie).permit :name, :image, :content, genre_ids: []
  end

  def find_movie
    @movie = Movie.find_by id: params[:id]
    if @movie.nil?
      flash[:danger] = t "genre.empty"
      redirect_to admin_root_path
    end
  end
end
