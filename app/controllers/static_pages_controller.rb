class StaticPagesController < ApplicationController
  def home
    @movie = Movie.first
  end

  def about
  end

  private 
end
