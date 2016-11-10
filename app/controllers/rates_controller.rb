class RatesController < ApplicationController
  before_action :check_rated, only: [:create]

  def create
    @rate = Rate.new rate_params
    if @rate.save
      flash[:success] = "Rate success"
      redirect_to :back
    else
      flash[:danger] = "Rate error"
      redirect_to root_path
    end
  end

  private
  def rate_params  
    params.require(:rate).permit :vote, :movie_id, :user_id
  end

  def check_rated
    @movie = Movie.find_by_id params[:rate][:movie_id]
    if current_user.has_voted @movie
      flash[:danger] = t "flash.fail"
      redirect_to @movie
    end
  end
end
