class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  
  has_many :comments
  has_many :rates
  
  enum role: {admin: 1, user: 0}
  mount_uploader :avatar, AvatarUploader
end
