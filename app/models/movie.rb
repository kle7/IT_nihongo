class Movie < ActiveRecord::Base
  has_many :conments
  has_many :rates
  has_many :genres, through: :movie_genres
  has_many :movie_genres, dependent: :destroy
  has_many :actors, through: :movie_actors
  has_many :movie_actors, dependent: :destroy
end
