class StaticPagesController < ApplicationController
  def home
    @movies = Movie.all.order('year DESC').page(params[:page]).per 8
    @top_movies = Movie.all.sort{ |a,b| (a.rates.average :vote) <=> 
      (b.rates.average :vote) || 
      (b.rates.average :vote && -1) || 1}
    @top_movies = @top_movies.last(10).reverse!
  end
  
  def about
  end

end
