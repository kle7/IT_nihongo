class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  
  has_many :comments, dependent: :destroy
  has_many :rates
  
  enum role: {admin: 1, user: 0}
  mount_uploader :avatar, AvatarUploader

  def has_voted movie
    movies = self.rates.collect {|r| r.movie}
    movies.include? movie
  end
end
