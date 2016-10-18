class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :comment
  has_many :movie
  enum role: {admin: 1, student: 0}
end
