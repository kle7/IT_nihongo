class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
    :omniauthable, :omniauth_providers => [:facebook]

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
 has_many :recived_notifications, class_name:  "Notification",
                                 foreign_key: "reciver_id",
                                 dependent:   :destroy
 has_many :sent_notifications, class_name:  "Notification",
                                  foreign_key: "sender_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :comments, dependent: :destroy
  has_many :rates
  has_many :bookmarks, dependent: :destroy
  enum role: {admin: 1, user: 0}
  mount_uploader :avatar, AvatarUploader
  scope :sended_user, ->user_id{where "SELECT reciver_id FROM notifications WHERE sender_id = ? 
    AND reciver_status != ? AND content =? ", user_id, 2, "follow"}

  def has_voted movie
    movies = self.rates.collect {|r| r.movie}
    movies.include? movie
  end

  # Follows a user.
  def follow other_user
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following? other_user
    following.include?(other_user)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.user_name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"] || session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
      user.email = data["email"]
    end
  end
end
end
