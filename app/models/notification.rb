class Notification < ApplicationRecord
	belongs_to :sender, class_name: "User"
  belongs_to :reciver, class_name: "User"
  validates :sender_id, presence: true
  validates :reciver_id, presence: true
end
