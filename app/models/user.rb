class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :comments
  has_many :rates
  enum role: {admin: 1, user: 0}
end
