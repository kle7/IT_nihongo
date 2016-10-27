class Admin::CustomersController < Admin::BaseController
  before_action :find_movie, only: [:edit, :update, :destroy, :show]
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = User.all
  end
  
  def show  
  end

  def destroy
    if @customer.destroy
      flash[:success] = t"customer.deteled"
    else
      flash[:danger] = t "flash.fail"
    end
    redirect_to admin_customers_path
  end

  private
  def movie_params
    params.require(:movie).permit :name, :image, :content, genre_ids: []
  end

  def set_customer
    @customer = User.find(params[:id])
  end
  def find_movie
    @movie = Movie.find_by id: params[:id]
    if @movie.nil?
      flash[:danger] = t "genre.empty"
      redirect_to admin_root_path
    end
  end
end
