class Genre < ActiveRecord::Base
  has_many :movies, through: :movie_genres
  has_many :movie_genres, dependent: :destroy
end
