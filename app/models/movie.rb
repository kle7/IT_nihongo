class Movie < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :rates
  has_many :genres, through: :movie_genres
  has_many :movie_genres, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  validates :name, presence: true
  validates :content, presence: true
  validates :year, presence: true

  accepts_nested_attributes_for :genres

  scope :reviewed_movie, ->user_id{where "movies.id IN (SELECT movie_id FROM rates WHERE user_id = ?)", user_id}
  scope :following_user_movies, ->user_id{where "movies.id IN (SELECT movie_id FROM bookmarks WHERE user_id IN 
    (SELECT followed_id FROM relationships where follower_id = ?))", user_id}

  include Bootsy::Container
  mount_uploader :image, MovieImageUploader
end
