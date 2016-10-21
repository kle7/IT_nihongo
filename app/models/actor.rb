class Actor < ActiveRecord
  has_many :movies, through: :movie_actors
  has_many :movie_actors, dependent: :destroy
end
