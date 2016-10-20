class Actor < ActiveRecord::Base
  has_many :movies, though: :movie_actors
  has_many :movie_actors, dependent: :destroy
end
