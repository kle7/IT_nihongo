class Admin::GenresController < Admin::BaseController
  before_action :find_genre, only: [:destroy, :edit, :update]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end
  

  def edit  
  end

  def update
    if @genre.update genre_params
      flash[:success] = t "genre.update"
    else
      flash[:danger] = t "flash.fail"
    end
    redirect_to admin_genres_path  
  end

  def create
    @genre = Genre.new genre_params
    if @genre.save
      flash[:success] = t "genre.success"
      redirect_to admin_genres_path
    else
      render :new
    end   
  end

  def destroy
    if @genre.destroy
      flash[:success] = t "genre.deteled"
    else
      flash[:danger] = t "flash.fail"
    end
    redirect_to admin_genres_path     
  end

  def update
    if @genre.update genre_params
      flash[:success] = t "categories.update"
    else
      flash[:danger] = t "flash.fail"
    end
    redirect_to admin_genres_path
  end

  private
  def verify_admin
    unless current_user.admin?
      flash[:danger] = t :not_have_permission
      redirect_to root_path
    end 
  end
  def find_genre
    @genre = Genre.find_by id: params[:id]
    if @genre.nil?
      flash[:danger] = t "genre.empty"
      redirect_to admin_root_path
    end
  end
  def genre_params
    params.require(:genre).permit :name
  end
end
