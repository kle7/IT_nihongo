class StaticPagesController < ApplicationController
  def home
    @movies = Movie.all.page(params[:page]).per 12
    @random_movies = Movie.order("RANDOM()").limit 10
  end

  def about
  end

end
